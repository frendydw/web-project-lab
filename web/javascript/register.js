function validateForm() {
	var username = document.forms['registerForm']['username'].value;
	var email = document.forms['registerForm']['email'].value;
	var gender = document.forms['registerForm']['gender'].value;
	var password = document.forms['registerForm']['password'].value;
	var cpassword = document.forms['registerForm']['cpassword'].value;

	if (username == "") {
		alert("Username must be filled out!");
		return false;
	}

	if (password == "") {
		alert("Password must be filled out!");
		return false;
	}

	if (email == "") {
		alert("Email must be filled out!");
		return false;
	}

	if (cpassword == "") {
		alert("Password confirmation must be filled out!");
		return false;
	}

	if (gender == "") {
		alert("Gender must be chosen!");
		return false;
	}

	if (username.length <= 4 || username.length >= 16) {
		alert("Username lenght must be between 4 and 16 characters!");
		return false;
	}

	if (/^[A-Za-z]+$/.test(email) == false) {
		alert("Invalid email address!");
		return false;
	}
	
	if (password.length < 8 || cpassword.length < 8) {
		alert("Password at least 8 characters!");
		return false;
	}

	if (password != cpassword) {
		alert("Password not match!");
		return false;
	}

}