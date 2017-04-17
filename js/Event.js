/* HERE */

$(function() {
	$('#commentErrorAlert').hide();
	$('#commentSuccessAlert').hide();
	$('#submit').hide();
	$('#cancel').hide();
	$('#rating').prop("disabled", true);
	$('#comment').prop("disabled", true);

	$('#edit').on('click', function() {
		$('#rating').prop("disabled", false);
		$('#comment').prop("disabled", false);
		$('#edit').hide();
		$('#delete').hide();
		$('#submit').show();
		$('#cancel').show();
	});

	$('#delete').on('click', function() {
		//TODO delete comment from dba and reload page
	});

	$('#submit').on('click', function() {
		//Change comment values in db and reload page
	});

	$('#cancel').on('click', function() {
		$('#rating').prop("disabled", true);
		$('#comment').prop("disabled", true);
		$('#submit').hide();
		$('#cancel').hide();
		$('#edit').show();
		$('#delete').show();
	});
});
