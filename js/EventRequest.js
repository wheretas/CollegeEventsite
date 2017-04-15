
$(function() {
	$('#errorAlert').hide();
	$('#successAlert').hide();
	$('#submitBtn').on('click', submitRequest);
	$('#reset').on('click', resetForm);
	$('#us3-lat').on('change', resetLoc);
	$('#us3-lon').on('change', resetLoc);


	function submitRequest()
	{
		if(!validateForm())
		{
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
		var time_regex = /^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$/;
		//var date_regex = /^(19|20)\-(0[1-9]|1[0-2])\-(0[1-9]|1\d|2\d|3[01])\d{2}$/;
		var email_regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var phone_regex = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;

		//var date_regex = /^(19|20)\-(0[1-9]|1[0-2])\-(0[1-9]|1\d|2\d|3[01])\d{2}$/;


		if($('#title').val() == "")
			errors++;

		if($('#description').val() == "")
			errors++;

		//if(!date_regex.test($('#date').val()))
			//errors++;

		//if(!time_regex.test($('#time').val()))
			//errors++;

		if(!phone_regex.test($('#contact_phone').val()))
			errors++;

		if(!email_regex.test($('#contact_email').val()))
			errors++;

	    if(errors>0)
	    {
	    	console.log(errors);
	    	$('#errorAlert').show();
	    	return 0;
	    }
	    return 1;
	}

	function resetLoc()
	{
		document.getElementById('latitude').value=document.getElementById('us3-lat').value;
		document.getElementById('longitude').value=document.getElementById('us3-lon').value;

	}
});


