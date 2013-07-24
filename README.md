#Uploads
--------

## Multi Part Forms:
When adding a file input field to a form, we'll need to adjust the form's attributes to include the enctype.

	<form action="/" method="POST" entype="multipart/form-data">
		<input type="file" accept="image/*" name="photo">
	</form>
	
I also added the accept attribute to the form.  If the server doesn't accept the file type the user selects, the file will be ignored.

