$(document).ready(function() {
  $(".add-performance button").click(function(){
    var el = $(".add-performance button");
    console.log(el.text());
    if (el.text() === "Add Performance") {
      el.text("Hide");
    } else {
      el.text("Add Performance");
    }
    
    $(".new-performance").toggleClass("hidden");
  });

});