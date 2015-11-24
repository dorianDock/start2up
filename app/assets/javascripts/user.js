// encoding: utf-8
$(document).
    on('page:change', function () {

        // when page is loading: we fill those lists
        var myUrl= $('.customTry ').data('url');
        $.ajax({
            url: myUrl,
            data: {
            }
        }).done(function (data) {
            for (i = 0; i < data.results.length; i++) {
                $('.customTry > select').append('<option value="'+data.results[i].value+'">'+data.results[i].name+'</option>');
            }
        });

        $('.special.cards .image').dimmer({
            on: 'hover'
        });

        $('.customTry')
            .dropdown({
                placeholder: 'Choisir une catégorie',
                apiSettings: {
                    url:$('.customTry').data('url')+'?query={query}'
                }
            });
    });