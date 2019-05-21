#! /usr/bin/env bash

## ##
## Some of the settings below are taken from the following repos
##
## https://github.com/mathiasbynens/dotfiles/blob/master/.macos
## https://github.com/rkalis/dotfiles/blob/master/macos/setup.sh
## https://github.com/nicksp/dotfiles/blob/master/osx/set-defaults.sh
## https://github.com/herrbischoff/awesome-macos-command-line
##
## However messing around with preferences (via `defaults` command)
## is fragile. Plist files are not meant to be a public interface
## to macOS and hence any settings can change from one OS version
## to the other without any warning.
##
## The more the preferences set via `defaults` the harder to
## realize whether something doesn't work anymore on the next
## version of macOS, resulting in a hard to debug and maintain
## the present script.
##
## Because of what reported above I have opted to a different
## approach:
##
## 1. preferences that can be set via the UI are done so
## 2. other preferences are left untouched unless absolutely useful
##
## Doing so the number of preferences set here (via `defaults`)
## are kept at minimum and spotting anything not working should
## be easier.
##
## A `MacOS setup.md` file can be found in this directory with
## the instructions to be followed to setup macOS as desired.
## Manual setup is not ideal I know, but this is a process that
## is done not more often than once per year and take no more
## than half an hour.
##
## Note to self: please resist the urge of adding any further
## `defaults` call in the future.
## ##

DIR=$(dirname "$0")
. $DIR/../script/common.sh


if [ ! is_darwin ] ; then
  substep_success "Not macos; nothing to do here..."
  exit 0
fi

substep_info "Moving to macos dir..."
cd "$DIR/.."

# Add /usr/local/sbin to the PATH (https://superuser.com/a/653811/1022668)
sudo sh -c "echo /usr/local/sbin/ > /etc/paths.d/10.usr_local_sbin"

# Remove quarantine attribute from application installed via Brewfile
find /Applications -depth 1 -name '*.app' -xattrname com.apple.quarantine -exec xattr -dr com.apple.quarantine {} \;

###############################################################################
#                                                                             #
# HIC SUNT DRACONES: in the following sections `defaults` is used. Anything   #
# can stop working at any time.                                               #
#                                                                             #
###############################################################################

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable popup accent / Enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Don't save to iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand printer panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Restart the Finder
killall Finder

###############################################################################
# Mail                                                                        #
###############################################################################

substep_info "Quitting Mail..."
osascript -e 'tell application "Mail" to quit'

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

substep_info "Starting Mail again..."
osascript -e 'tell application "Mail" to activate'

###############################################################################
# Terminal                                                                    #
###############################################################################

# Add Jellybeans theme to the Terminal
open Jellybeans.terminal

# Set Jellybeans theme as default
osascript -e 'tell application "Terminal"' -e 'activate' -e 'set default settings to settings set "Jellybeans"' -e 'set startup settings to settings set "Jellybeans"' -e 'end tell'

###############################################################################
# Finish up                                                                   #
###############################################################################

# Open macOS settings document
substep_info "Opening manual settings docs, please follow the instructions reported there..."
open "MacOS setup.md"

substep_success "Done with macos."
