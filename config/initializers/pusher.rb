

require 'pusher'

pusher = Pusher::Client.new app_id: 'YOUR APP ID', key: 'YOUR APP KEY', secret: 'YOUR APP SECRET'

# trigger on my_channel' an event called 'my_event' with this payload:

pusher.trigger('my_channel', 'my_event', {
                               message: 'hello world'
                           })