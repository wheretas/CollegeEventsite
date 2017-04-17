$(function() {
    $('#EventTable').DataTable();




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