function validateForm() {
	var name = document.forms['insertProductForm']['name'].value;
	var description = document.forms['insertProductForm']['description'].value;
	var stock = document.forms['insertProductForm']['stock'].value;
	var price = document.forms['insertProductForm']['price'].value;
	
	if (name == "") {
		alert("Product's name must be filled out!");
		return false;
	}

	if (description == "") {
		alert("Description must be filled out!");
		return false;
	}

	if (price == 0) {
		alert("Price must be more than zero!");
		return false;
	}

	if (stock == 0) {
		alert("Stock must be more than zero!");
		return false;
	}
}