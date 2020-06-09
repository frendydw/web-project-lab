function validateForm() {
	var cpassword = document.forms['changePasswordForm']['cpassword'].value;
	var npassword = document.forms['changePasswordForm']['npassword'].value;
	var password = document.forms['changePasswordForm']['password'].value;

	

	if (npassword == "") {
		alert("New Password must be filled out!");
		return false;
	}

	if (cpassword == "") {
		alert("Confirm New Password must be filled out!");
		return false;
	}

	if (password == "") {
		alert("Old Password must be filled out!");
		return false;
	}

	if (npassword != cpassword) {
		alert("New Password and Confirmed Password not match!");
		return false;
	}

	if (cpassword.length < 8 || npassword.length < 8) {
		alert("Password at least 8 characters!");
		return false;
	}
}