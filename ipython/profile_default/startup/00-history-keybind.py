from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus

ip = get_ipython()

def history_fwd(event):
    event.current_buffer.history_forward(count=event.arg)

def history_back(event):
    event.current_buffer.history_backward(count=event.arg)

# Register the shortcut if IPython is using prompt_toolkit
if getattr(ip, 'pt_app', None):
    registry = ip.pt_app.key_bindings
    registry.add_binding('escape', 'p',
                         filter=HasFocus(DEFAULT_BUFFER))(history_back)
    registry.add_binding('escape', 'n',
                         filter=HasFocus(DEFAULT_BUFFER))(history_fwd)
