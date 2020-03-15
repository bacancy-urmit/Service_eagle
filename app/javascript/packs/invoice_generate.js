$(document).ready(function() {


    $(".tr").each(function() {
        var td = $(this);
        var data = td.find("#service_status").text();
        if (data == 'completed') {

            td.find("#show_invoice").show();
            td.find("#edit_option").hide()
            td.find("#show_option").hide()
            td.find("#delete_option").hide()
        } else {
            td.find("#show_invoice").hide();
            td.find("#edit_options").show()
            td.find("#show_options").show()
            td.find("#delete_options").show()
        }
    });
});