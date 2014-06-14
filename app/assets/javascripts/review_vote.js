
$(".add-performance button").click(function(){
  
  var el = $(".add-performance button");
  if (el.text() === "Add Performance") {
    el.text("Hide");
  } else {
    el.text("Add Performance");
  }
  
  $(".new-performance").toggleClass("hidden");
});

$(".upvote").click(function(e) {
  $.ajax({
    dataType: "json",
    type: "post",
    url: "/reviews/" + parseInt(e.target.id) + "/review_votes",
    data: { vote: "up" },

    success: function(success) {
      var buttons = "." + success["review"].id;
      var divId = ".div-" + success["review"].id;
      var voteTotal = divId + " .vote-count span";
      var span_tag = $("<span>");

      $(buttons).remove();
      span_tag.text("Voted Up");
      span_tag.appendTo(divId);

      $(voteTotal).text(success["vote_count"]);
    }
  });
});

$(".downvote").click(function(e) {
  $.ajax({
    dataType: "json",
    type: "post",
    url: "/reviews/" + parseInt(e.target.id) + "/review_votes",
    data: { vote: "down" },
    
    success: function(success) {
      var buttons = "." + success["review"].id;
      var divId = ".div-" + success["review"].id;
      var voteTotal = divId + " .vote-count span";
      var span_tag = $("<span>");

      $(buttons).remove();
      span_tag.text("Voted Down");
      span_tag.appendTo(divId);

      $(voteTotal).text(success["vote_count"]);
    }
  });
});

