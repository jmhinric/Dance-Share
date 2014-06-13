
// TODO namespace these functions


App.Home.intervalID, App.Home.fullTitle, App.Home.mouseX, App.Home.mouseY;

$(".video-title").mouseenter(handlerIn).mouseleave(handlerOut);

function handlerIn(e) {
  App.Home.fullTitle = $(e.target).siblings(".full-title");
  App.Home.mouseX = e.pageX;
  App.Home.mouseY = e.pageY;
  App.Home.intervalID = setTimeout(showTitle, 1500);
}

function showTitle() {
  App.Home.fullTitle.show();
  App.Home.fullTitle.css({
    top: (App.Home.mouseY + 5) + "px",
    left: (App.Home.mouseX) + "px"
  });
}

function handlerOut(e) {
  clearInterval(App.Home.intervalID);
  $(e.target).siblings(".full-title")
             .css("display", "hidden");
}

