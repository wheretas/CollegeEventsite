$(function() {
	$('#createEventNav').hide();
    $('#createUniNav').hide();

    var userRole=getUserRole();

    //console.log('userole: '+userRole);

    /*if(userRole>=1)
    {
    	$('#createEventNav').show();
    }
    if(userRole==2)
    {
        $('#createUniNav').show();
    }*/

    function getUserRole() {
        var realUserRole;
    	var tempUserRole=$.post("getUserRole.php", function() {
    	})
    	.done(function(resp) {
            realUserRole = JSON.stringify(resp).substring(5,6);
            if(realUserRole>=2)
            {
                $('#createEventNav').show();
                $('#rsoRequest').hide();
            }
            if(realUserRole==3)
            {
                $('#createUniNav').show();
                $('#rsoRequest').hide();
            }
    	})
    	.fail(function() {
    		alert("ajax failure");
    	})
    	return realUserRole;
    }
});
