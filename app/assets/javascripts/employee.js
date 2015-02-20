function EmployeeValidator() {

 jQuery.validator.addMethod("phone_fmt", function(value, element) {
  return this.optional(element) || value == value.match(/^\d{10}$/);
});


 jQuery.validator.addMethod("change", function(value, element) {
  var a = element.files[0].size;
  if(a > 5120)
    return false;
  else
    return true;
});

 $('#Employ_card').validate({
  debug: true,
  rules: {
    "employee[employ_name]": {
      required: true,
      maxlength: 30
    },
    "employee[phone_no]": {
     required: true,
     phone_fmt:true
   },
   "employee[department]" : {
    required: true
  },
  "employee[employ_information]": {
    maxlength: 320
  },
  "employee[profile_picture]": {
    accept: "png|jpeg|jpg|JPG|JPEG|PNG",
    change: true
  }
},

errorElement: "span",
errorClass: "help-block",

messages: {
  "employee[employ_name]": {
    required:"This field is required!",
    maxlength: "Maximum request length exceeded!"
  },
  "employee[phone_no]": {
   required: "This field is required!",
   phone_fmt: "Requires 10-digit number!"
 },
 "employee[department]" : {
  required: "This field is required!",
},
"employee[employ_information]": {
  maxlength: "Maximum request length exceeded!"
},
"employee[profile_picture]": {
 accept: "Invalid image format!",
 change: "File exceeds 5kb!"
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
        alert();
        form.submit();
      }
    });

}