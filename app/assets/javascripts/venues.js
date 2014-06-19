$("form.wide-thirty").submit(function(e) {
  e.preventDefault();

  var name = $(".venue-name").val();
  var address = $(".venue-address").val();

  $.ajax({
    dataType: "json",
    type: "post",
    url: "/venues/new",
    data: { name: name, address: address },

    success: function(success) {
      $(".wide-thirty").remove();
      showVenues(success);
    }
  });
});

function showVenues(success) {
  
}


