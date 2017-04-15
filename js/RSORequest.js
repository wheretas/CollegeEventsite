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
	    	return 0;
	    }
	    return 1;
	    //document.forms["form"].submit();
	}
});
