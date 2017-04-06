$(function() {
	$('#createEventNav').hide();
    $('#createUniNav').hide();
    var userRole=getUserRole();

    if(userRole>=1)
    {
    	$('#createEventNav').show();
    }
    if(userRole==2)
    {
        $('#createUniNav').show();
    }

    function getUserRole() {
    	var tempUserRole=$.post("getUserRole.php", function() {
    		alert("ajax called");
    	})
    	.done(function() {
    		alert("ajax success");
    	})
    	.fail(function() {
    		alert("ajax failure");
    	})
    	return 1;
    }
});