$("form.wide-thirty").submit(function(e) {
  e.preventDefault();

  var name = $(".venue-name").val();
  var address = $(".venue-address").val();

  $.ajax({
    dataType: "json",
    type: "get",
    url: "/venues/get_venues",
    data: { venue_name: name, venue_address: address },

    success: function(success) {
      $(".wide-thirty").remove();
      appendUl();
      showVenues(success);
    }
  });
});

function appendUl() {
  var template = $("script.venues-list").html();
  var rendered = _.template(template);
  $(".single-form").append(rendered);
}

function showVenues(success) {
  venues = success["venues"];

  if (venues.length > 0) {
    success["venues"].forEach(function(venue) {
      var template = $("script.list-venue").html();
      var rendered = _.template(template, { venue: venue });
      addListener();

      $(".venue-set").append(rendered);
    });
  }
}

function addListener() {
  $(".single-venue-li").click(function(e) {
    console.log("Success!");
    $.ajax({
      dataType: "json",
      type: "post",
      url: "/companies//runs/create",
      data: { venue: $(e).data('venue') }
    });
  });
}






