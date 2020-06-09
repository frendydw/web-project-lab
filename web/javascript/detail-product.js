function validateForm() {
	var review = document.forms['detailProductForm']['review'].value;
	
	if (review == "") {
		alert("Review must be filled out!");
		return false;
	}

	if (review.length <= 3) {
		alert("Review must be more than 3 characters");
		return false;
	}
}