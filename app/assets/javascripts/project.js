function ProjectsValidator() {

 jQuery.validator.addMethod("image_size", function(value, element) {
  if (value == 0)
    return true;
  else if(element.files[0].size > 5120)
    return false;
  else
    return true;
});

 $('#Project_card').validate({
  debug: true,
  rules: {
    "project[project_name]": {
      required: true,
      maxlength: 30
    },
    "project[projrct_description]": {
     required: true
   },
   "project[project_information]": {
    maxlength: 320
  },
  "project[project_icon]": {
    accept: "png|jpeg|jpg|JPG|JPEG|PNG",
    image_size: true
  }
},

errorElement: "span",
errorClass: "help-block",

messages: {
  "project[project_name]": {
    required:"This field is required!",
    maxlength: "Maximum request length exceeded!"
  },
  "project[projrct_description]": {
   required: "This field is required!"
 },
 "project[project_information]": {
  maxlength: "Maximum request length exceeded!"
},
"project[project_icon]": {
 accept: "Invalid image format!",
 image_size: "File exceeds 5kb!"
}
},

highlight: function(element) {
 $(element).parent().parent().addClass("has-error");
},

unhighlight: function(element) {
 $(element).parent().parent().removeClass("has-error");
},

invalidHandler: function(event, validator) {
        // 'this' refers to the form
        var errors = validator.numberOfInvalids();
        if (errors) {

          // Populating error message
          var errorMessage = errors == 1
          ? 'You missed 1 field. It has been highlighted'
          : 'You missed ' + errors + ' fields. They have been highlighted';

          // Removing the form error if it already exists
          $("#div_user_js_validation_error").remove();

          errorHtml = "<div id='div_user_js_validation_error' class=\"alert alert-danger\" data-alert=\"alert\" style=\"margin-bottom:5px;\">"+ errorMessage +"</div>"
          //$("#div_user_details").prepend(errorHtml);
          $("#div_modal_generic div.modal-body-main").prepend(errorHtml);

          // Show error labels
          $("div.error").show();

        } else {
          // Hide error labels
          $("div.error").hide();
          // Removing the error message
          $("#div_user_js_validation_error").remove();
        }

      },
      submitHandler: function(form) {
        form.submit();
      }
    });
setTimeout(function(){ $("#exampleInputFile").change(function(){
  if (this.files && this.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#preview').attr('src', e.target.result);
    }
    reader.readAsDataURL(this.files[0]);
  }
}); }, 400);
}