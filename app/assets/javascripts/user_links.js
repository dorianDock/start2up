
/**
 * Created by Dorian on 27/10/2015.
 */
$(document).
    on('page:change', function () {
        $('.validateRequests').click(function () {

            var url = $(this).data('url');
            var requestId = $(this).data('id');
            $.ajax({
                url: url,
                data: {
                    id: requestId,
                    myBool: false
                }
            }).done(function (data) {
                console.log('good ol ajax method');
                console.log(data);
            });

        });
    });


