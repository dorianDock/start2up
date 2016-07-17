


$(document).on('page:change', function () {

    // call back for indicating that we read a link
    var callBackForLinkReading=function(e, data, status, xhr,customField){
        // we just alert on the status of the request
        showSuccess('Le statut du lien a bien été changé !');
        $('.newlinkInteraction'+data.useful_link_id).hide();
    };

    var callBackForLinkReadingError=function(e, data, status, xhr){
        // we just alert on the status of the request
        console.log(data);
    };

    $('.newlinkInteraction')
        .on("ajax:success", callBackForLinkReading)
        .on("ajax:error", callBackForLinkReadingError);


});

