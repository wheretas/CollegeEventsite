$(function() {
	$('#errorAlert').hide();
	$('#successAlert').hide();
	$('#submitBtn').on('click', submitRequest);
	$('#reset').on('click', resetForm);

	function submitRequest()
	{
		if(!validateForm())
		{
			console.log('got here');
			return;
		}

		//TODO Form suibmission

		//on success
		$('#successAlert').show();
	};

	function resetForm()
	{
		$('#genInfo').find("textarea, input, select").val('').end();
	}

	function validateForm()
	{
		$('#errorAlert').hide();
		$('#successAlert').hide();
		var errors = 0;
		var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		if($('#title').val() == "")
			errors++;

		if(!regex.test($('#adminEmail').val()))
			errors++;

		var emailList= $("#memberEmails").val().split(',');

		if(emailList.length<4)
			errors++;

	    for (i=0;i<emailList.length;i++)
	    {
	       if(!regex.test(emailList[i])) errors++;
	    }

	    if(errors>0)
	    {
	    	console.log(errors);
	    	$('#errorAlert').show();
	    	return false;
	    }
	    return true;
	    //document.forms["form"].submit();
	}

	//pass this function the email variable with a .val() and returns the name of the school the email belongs to
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
