$(function() {
    $('#eventsTable').DataTable();

    $('.clickable-row').click(function() {
    	var table = document.getElementById('myEventsTable');
    	var cell = table.rows.item($(this).index()+1).cells;
    	var cellval = cell.item(0).innerHTML;

        window.location = $(this).data("href")+cellval;
    });
});