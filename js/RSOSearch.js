$(function() {
    $('#RSOTable').DataTable();

    $('.clickable-row').click(function() {
    	var table = document.getElementById('RSOTable');
    	var cell = table.rows.item($(this).index()+1).cells;

    	//the name of the RSO 
    	var RSOName = cell.item(0).innerHTML;
    });

    function schoolFromEmail(email) 
	{
		var address = email.toString().substring(email.indexOf('@')+1, email.length);
		if(address.includes("ucf"))
			return 'UCF';
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