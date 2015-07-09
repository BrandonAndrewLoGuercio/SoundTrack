function receive_notification_count(value) {
    $('#notification_count').html(value)
}

$(function() {
    function updateNotifications() {
        var call = $.getScript('/get_notifications/')
    }
    setInterval(updateNotifications, 30000)
})