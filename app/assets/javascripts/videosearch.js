function init() {
    gapi.client.setApiKey("AIzaSyDtxYNoD2Gfb89yy9CkcMOj2U31k8EEPCQ");
    gapi.client.load("youtube", "v3", function () {
        // yt api is ready
    });
}

function getfilledYouTubeTemplate(title, videoID) {
    var result = $(document.getElementById('youtube_template')).find('div').clone()
    result.find('h2').html(title)
    result.find('iframe').attr('src', '//www.youtube.com/embed/' + videoID)
    result.find('#vid_id').attr('value', videoID)
    result.find('#vid_tit').attr('value', title)


    return result
}

$(function () {
    $("#video_search").on("submit", function (e) {
        e.preventDefault();
        // prepare the request
        var request = gapi.client.youtube.search.list({
            part: "snippet",
            type: "video",
            q: encodeURIComponent($("#vid_search").val()).replace(/%20/g, "+"),
            maxResults: 5,
            order: "relevance",
            publishedAfter: "2005-01-01T00:00:00Z"
        });
        // execute the request
        request.execute(function (response) {
            var results = response.result;
            $("#results").html("");
            $.each(results.items, function (index, item) {
                var new_node = getfilledYouTubeTemplate(item.snippet.title, item.id.videoId);
                $("#results").append(new_node);
            });
        });
        resetVideoHeight();
    });
});

$(window).on("resize", resetVideoHeight);

function resetVideoHeight() {
    $(".video").css("height", $("#results").width() * 9 / 16);
}

