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

function AjaxRequest(targetUrl, parameters, callBackFunction){
    $.ajax({
        url: targetUrl,
        data: parameters
    }).done(callBackFunction);
}

function showSuccess(headerText, contentText){
    $('.myCustomSuccessMessage > .myCustomSuccessMessageHeader').html(headerText);
    $('.myCustomSuccessMessage > .myCustomSuccessMessageContent').html(contentText);
    $('.myCustomSuccessMessage').show();
}

// Initialize function for select lists
function InitializeSelectList(aCssClass, placeHolder){

    var myUrl=$('.'+aCssClass).data('url');

    $.ajax({
        url: myUrl,
        data: {
        }
    }).done(function (data) {
        for (i = 0; i < data.results.length; i++) {
            $('.'+aCssClass+' > select').append('<option value="'+data.results[i].value+'">'+data.results[i].name+'</option>');
        }

        // objectLink is the entity by which we are going to take the data already set
        var objectLink=$('.'+aCssClass+' > select').data('objectlinkid');
        if(objectLink!=undefined && objectLink!=""){
            var initializeUrl=$('.'+aCssClass+' > select').data('initializeurl');
            var changeTheDropDown=function(data){
                // we change the data from [] to [""]
                for (i = 0; i < data.length; i++) {
                    data[i]=data[i].toString();
                }
                $('.'+aCssClass).dropdown('set selected', data);
            };
            var parameters={ userid: objectLink};
            AjaxRequest(initializeUrl,parameters,changeTheDropDown);
        }


    });
    $('.'+aCssClass)
        .dropdown({
            placeholder: placeHolder,
            apiSettings: {
                url:myUrl+'?query={query}'
            }
        });

}


















