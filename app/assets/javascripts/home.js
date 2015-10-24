

$(document).
    on('page:change', function () {

    $('.homeSquareMenu')
        .popup({
            inline   : true,
            hoverable: false,
            position : 'right center',

        })
    ;

    function handlerIn(element){
        console.log(element);
        console.log(element.currentTarget);
        var theTarget=$(element.currentTarget);
        var nameToReach=theTarget.data('content');
        var explanationToReach=theTarget.data('explanation');
        var customColor='#'+ theTarget.data('customcolor');
        nameToReach='<p style="color:'+customColor+';">'+nameToReach+'</p>';
        $('.homeDestination').html(nameToReach);
        $('.homeSectionDescription').html(explanationToReach);



    }

    function handlerOut(element){
        //console.log(element);
        //console.log(element.currentTarget);
    }


    $('.homeSquare').hover(handlerIn, handlerOut);



});