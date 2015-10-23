function like_function(id, button, heart, sum) {
  if (button.hasClass("decrement")) {
    $.ajax({url: "/likes", type: "POST", data: {prototype_id: id, dataType: "json"}})
    .done(function(data) {
      button.removeClass("decrement").addClass("increment")
      heart.attr("src", "/assets/icon_heart_red.svg")
      sum.text(data["count"])
    });
  } else {
    $.ajax({url: "/likes/" + id, type: "PATCH", data: {prototype_id: id, dataType: "json"}})
    .done(function(data) {
      button.removeClass("increment").addClass("decrement")
      heart.attr("src", "/assets/icon_heart.svg")
      sum.text(data["count"])
    })
  }
}
