$(function() {
    $('#myEventsTable').DataTable();

    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
});
