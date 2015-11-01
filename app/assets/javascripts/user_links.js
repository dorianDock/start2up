
/**
 * Created by Dorian on 27/10/2015.
 */
$(document).
    on('page:change', function () {

        function BindStatusChangingBehaviour(aSelector){

            $(aSelector).click(function () {

                var url = $(this).data('url');
                var requestId = $(this).data('id');
                var myBool = $(this).data('accept');
                $.ajax({
                    url: url,
                    data: {
                        id: requestId,
                        isAccepted: myBool
                    }
                }).done(function (data) {
                    $('.requestLine'+data.id).after(data.partial_view);
                    $('.receivedRequestsTBody > .requestLine'+data.id).first().remove();
                    BindStatusChangingBehaviour('.requestLine'+data.id+' > td > .validateRequests');
                    showSuccess('Votre choix', 'Votre decision est maintenant effective');
                    console.log(data);
                });

            });
        }

        BindStatusChangingBehaviour('.validateRequests');



    });


