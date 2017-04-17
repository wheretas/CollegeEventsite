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

		if($('#title').val() == "")
			errors++;
		if($('#location').val() == "")
			errors++;
		if($('#numStudents').val() == "")
			errors++;
		if($('#description').val() == "")
			errors++;

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
