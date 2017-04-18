$(function() {
    $('#EventTable').DataTable();

    $('.clickable-row').click(function() {
    	var table = document.getElementById('EventTable');
    	var cell = table.rows.item($(this).index()+1).cells;
    	var cellval = cell.item(0).innerHTML;

        window.location = $(this).data("href")+cellval;
    });


    function schoolFromEmail(email) 
	{
		var address = email.toString().substring(email.indexOf('@')+1, email.length);
		if(address.includes("ucf"))
		{
			alert("UCF!!!!");
			return 'UCF';
		}
		if(address.includes("uf"))
			return 'UF';
		if(address.includes("fsu"))
			return 'FSU';
		if(address.includes("gt"))
			return 'GT';
		else
			return 'N/A';

	}
});