// encoding: utf-8
$(document).
    on('page:change', function () {

        // when page is loading: we fill those lists
        if($('.userSkills').length >0){
            InitializeSelectList('userSkills', 'Choisir des skills');
        }
    
        // We initialize each category component
        var numberOfConcepts=$('.conceptCategorySelect').length;

        $('.conceptCategorySelect').each(function(index, element){
            var conceptId=$(element).data('objectlinkid');
            var nameOfTheElementClass="conceptCategory"+conceptId;
            InitializeSelectList(nameOfTheElementClass, 'Choisir une categorie');
        });

        $('.special.cards .image').dimmer({
            on: 'hover'
        });

        userId = $('.userProfile').data('userid');
        // Skills editing
        $('.validationForUserSkills').click(function () {
            var url = $(this).data('url');
            // getting back the data of the skills
            var idList = '';
            $('.userSkills > [data-value]').each(function (index, value) {
                if (index == 0) {
                    idList += ($(this).data('value'));
                } else {
                    idList += (',' + $(this).data('value'));
                }
            });
            var data = {userid: userId, skills: idList};
            var myReturnFunction = function alertWentFineOnSkillUpdate(data) {
                showSuccess('Skills saved', '');
            };
            AjaxRequest(url, data, myReturnFunction);
        });

        // adding a new idea when we click on the plus button
        $('.addIdea').click(function () {
            var myReturnFunction=function(data){
                $(".ui.items").append(data.partial_view);
                // we load the category components for the concept
                if(data.conceptid){
                    var conceptId=data.conceptid;
                    var nameOfTheElementClass="conceptCategory"+conceptId;
                    InitializeSelectList(nameOfTheElementClass, 'Choisir une categorie'+conceptId);
                }

            };
            var parameters={userid: userId};
            AjaxRequest($(this).data('url'), parameters, myReturnFunction);
        });

        $('.removeConcept').click(function () {
            var myReturnFunction=function(data){
                if(data.message){
                    showSuccess(data.message,'')
                    $('.concept'+data.conceptid).hide();
                }
            };
            var conceptid=$(this).data('conceptid');
            var parameters={conceptid: conceptid};
            AjaxRequest($(this).data('url'), parameters, myReturnFunction);
        });

    });