//encoding: utf-8

function CalculateDistance(firstX, secondX, firstY, secondY){
    var distanceToBlock=Math.sqrt(Math.pow((firstX-secondX),2)+Math.pow((firstY-secondY),2));
    return distanceToBlock;
}


$(document).
    on('page:change', function () {

    $('.homeSquare')
        .popup({
            inline   : true,
            hoverable: true,

        })
    ;

    $('body').on('mousemove',function(event){
        var x = event.clientX;
        var y = event.clientY;

        $('.homeSquare').each(function() {
            var myElement= $(this);
            var xContainer=myElement.offset().left;
            xContainer=xContainer+myElement.width()/2;
            var yContainer=myElement.offset().top;
            yContainer=yContainer+myElement.height()/2;
            var distanceToBlock=CalculateDistance(xContainer,x,yContainer,y);
            if(distanceToBlock<=400){
                myElement
                    .popup('show')
                ;
            } else{
                myElement
                    .popup('hide')
                ;
            }
        });
    });



    //function handlerIn(element){
    //    console.log(element);
    //    console.log(element.currentTarget);
    //    var theTarget=$(element.currentTarget);
    //    var nameToReach=theTarget.data('content');
    //    var explanationToReach=theTarget.data('explanation');
    //    var customColor='#'+ theTarget.data('customcolor');
    //    nameToReach='<p style="color:'+customColor+';">'+nameToReach+'</p>';
    //    $('.homeDestination').html(nameToReach);
    //    $('.homeSectionDescription').html(explanationToReach);
    //
    //
    //
    //}
    //
    //function handlerOut(element){
    //    //console.log(element);
    //    //console.log(element.currentTarget);
    //}
    //
    //
    //$('.homeSquare').hover(handlerIn, handlerOut);



});