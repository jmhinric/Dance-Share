$(".vote-buttons").click(function(e) {
  var vote = $(e.target).hasClass("upvote") ? "Up" : "Down";

  $.ajax({
    dataType: "json",
    type: "post",
    url: "/reviews/" + parseInt(e.target.id) + "/review_votes",
    data: { vote: vote },

    success: function(success) {
      var buttons = "." + parseInt(success["review_id"]);
      var divId = ".div-" + parseInt(success["review_id"]);
      var voteTotal = divId + " .vote-count span";
      var span_tag = $("<span>");

      $(buttons).remove();
      span_tag.text("Voted " + vote);
      span_tag.appendTo(divId);

      $(voteTotal).text(success["vote_count"]);
    }
  });
});