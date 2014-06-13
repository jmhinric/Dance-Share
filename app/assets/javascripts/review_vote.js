
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
      var bClass = "." + success["review"].id;
      var divId = ".div-" + success["review"].id;
      $(bClass).remove();
      var span_tag = $("<span>");
      span_tag.text("Voted Up | " + success["vote_count"]);
      span_tag.appendTo(divId);
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
      var bClass = "." + success["review"].id;
      var divId = ".div-" + success["review"].id;
      $(bClass).remove();
      var span_tag = $("<span>");
      span_tag.text("Voted Down | " + success["vote_count"]);
      span_tag.appendTo(divId);
    }
  });
});

