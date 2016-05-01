//encoding: utf-8
$(document).
    on('page:change', function () {
        if($('.usefulLinksCategory').length!==0){
            InitializeSelectList('usefulLinksCategory', 'Choisir une catégorie');
        }
        if($('.usefulLinksCategoryEdit').length!==0){
        $('.usefulLinksCategoryEdit').each(function(index, element){
            var elementId=$(element).data('objectlinkid');
            var nameOfTheElementClass="usefulLinksCategory"+elementId;
            InitializeSelectList(nameOfTheElementClass, 'Choisir une catégorie');
        });


    }


    });