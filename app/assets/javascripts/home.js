

$(document).
    on('page:change', function () {

<<<<<<< HEAD
    //$('.homeSquare')
    //    .popup({
    //        inline   : true,
    //        hoverable: false,
    //        position : 'top center',
    //        delay: {
    //            show: 100,
    //            hide: 100
    //        }
    //    })
    //;
=======
    $('.homeSquareMenu')
        .popup({
            inline   : true,
            hoverable: false,
            position : 'right center',

        })
    ;
>>>>>>> improvedMenuPage

    function handlerIn(element){
        console.log(element);
        console.log(element.currentTarget);
        var theTarget=$(element.currentTarget);
        var nameToReach=theTarget.data('content');
<<<<<<< HEAD
        var customColor='#'+ theTarget.data('customcolor');
        nameToReach='<p style="color:'+customColor+';">'+nameToReach+'</p>';
        $('.homeDestination').html(nameToReach);
=======
        var explanationToReach=theTarget.data('explanation');
        var customColor='#'+ theTarget.data('customcolor');
        nameToReach='<p style="color:'+customColor+';">'+nameToReach+'</p>';
        $('.homeDestination').html(nameToReach);
        $('.homeSectionDescription').html(explanationToReach);
>>>>>>> improvedMenuPage



    }

    function handlerOut(element){
<<<<<<< HEAD
        console.log(element);
        console.log(element.currentTarget);
=======
        //console.log(element);
        //console.log(element.currentTarget);
>>>>>>> improvedMenuPage
    }


    $('.homeSquare').hover(handlerIn, handlerOut);



});