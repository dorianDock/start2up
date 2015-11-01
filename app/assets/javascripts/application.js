// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require turbolinks
// Loads all Semantic javascripts
//= require semantic-ui
//= require_tree .

// load checkboxes
//$('.ui.checkbox')
//    .checkbox()
//;
$( document).on('page:change', function () {
    $('.message > .close')
        .on('click', function() {
            $(this)
                .closest('.message')
                .transition('fade')
            ;
        })
    ;

    $('.myCustomSuccessMessage').hide();

});

function showSuccess(headerText, contentText){
    $('.myCustomSuccessMessage > .myCustomSuccessMessageHeader').html(headerText);
    $('.myCustomSuccessMessage > .myCustomSuccessMessageContent').html(contentText);
    $('.myCustomSuccessMessage').show();

}
