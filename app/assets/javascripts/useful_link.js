//encoding: utf-8
$(document).
    on('page:change', function () {
        InitializeSelectList('usefulLinksCategory', 'Choisir une cat�gorie');

        $('.usefulLinksCategoryEdit').each(function(index, element){
            var elementId=$(element).data('objectlinkid');
            var nameOfTheElementClass="usefulLinksCategory"+elementId;
            InitializeSelectList(nameOfTheElementClass, 'Choisir une cat�gorie');
        });
    });