function upload_main_image(field){
  fileLoad(field, function(e){
    $("#main_preview").attr("src", e.currentTarget.result).show();
    $(".cover-image-upload").css("background", "white");
  });
}

function upload_image_user(field){
  fileLoad(field, function(e){
    $("#user_avatar").attr("src", e.currentTarget.result).css("display", "");
  });
};

function upload_sub_image(field, i){
  fileLoad(field, function(e){
    $("#sub_" + i + "_preview").attr("src", e.currentTarget.result).show()
    $("#image_" + i + "_uploader").css("background", "white");
  });
}

function fileLoad(field, onLoadCallback) {
  var file = $(field).prop("files")[0],
  reader = new FileReader();
  reader.onload = onLoadCallback;
  reader.readAsDataURL(file);
}

function check_sub_image(i){
  var imagePreview = $("#sub_" + i + "_preview")
  if (imagePreview.attr("src") != undefined) {
    imagePreview.show();
    $("#image_" + i + "_uploader").css("background", "white");
  }
}

function hide_add_mark() {
  var $hideForm = $(".hide_form:first")
  $hideForm.show()
           .removeClass("hide_form")
           .addClass("appear_form");
  if($(".appear_form").length === 3){
    $(".add_sub_image_form").hide()
  }
}

function add_new_form(addForm, hideForm) {
  addForm.hide()
  hideForm.show()
          .removeClass("hide_form")
          .addClass("appear_form");
}