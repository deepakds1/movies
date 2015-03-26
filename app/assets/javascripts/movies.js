// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
    $("#movie_realese").datepicker()
       //minDate: new Date(),
       // maxDate: new Date(),
       // dateFormat: "dd-mm-yy"


    $("#movie_trailerdate").datepicker();

    $('.rateit').bind('rated reset', function (e) {
        var ri = $(this);
        var value = ri.rateit('value');
        ri.rateit('readonly', true);
       // var frm = ri.closest('form');
        var movie_id = $(this).parent().parent().attr("id")
        $.ajax({
            url: 'movies/' + movie_id + '/rate',
            data: { ratings: value },
            type: 'POST',
            success: function (data) {
            }

        });

    });
    //------------------------------------------------------------------------------------------------------------
    $("#sortable").sortable({
        update: function (event, ui) {
            var list = [];
            var changed_list = $("#sortable").sortable('toArray');

            for (var i = 0; i < changed_list.length; i++) {
                list.push({id: changed_list[i], order_no: i})
                console.log(changed_list[i], i)

            }
            $.ajax({
                dataType: 'json',
                url: '/movies/sort',
                method: "POST",
                data: {changed_orders: list}

            });
        }
    });


//---------------------------------------------------------------------------------------------------------------
jQuery.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
    this.submit(function() {
        $.post(this.action, $(this).serialize(), null, "script");
        return false;
    })
    return this;
};
});

$(document).ready(function() {
    $("#new_movie").submitWithAjax();
})

//-----------------------------------------------------------------------------------------------------------------