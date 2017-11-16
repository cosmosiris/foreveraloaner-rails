$(document).ready(function () {
  console.log("post_form.js running")
  fileUploadListener();
})


var fileUploadListener = function () {
  $('#img-upload').on('change', function () {
    var uploadTarget = $(this)
    var filename = uploadTarget[0].value
    console.log(filename)
    $('#upload-filename').text(filename)
  })
}
