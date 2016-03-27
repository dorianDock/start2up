//encoding: utf-8
$(document).
    on('page:change', function () {
        InitializeSelectList('usefulLinksCategory', 'Choisir une catégorie');

        $('.usefulLinksCategoryEdit').each(function(index, element){
            var elementId=$(element).data('objectlinkid');
            var nameOfTheElementClass="usefulLinksCategory"+elementId;
            InitializeSelectList(nameOfTheElementClass, 'Choisir une catégorie');
        });
    });