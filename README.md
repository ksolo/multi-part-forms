#Uploads
--------

## Multi Part Forms:
When adding a file input field to a form, we'll need to adjust the form's attributes to include the enctype.

	<form action="/" method="POST" entype="multipart/form-data">
		<input type="file" accept="image/*" name="photo">
	</form>
	
I also added the accept attribute to the form.  If the server doesn't accept the file type the user selects, the file will be ignored.

So…What does this do?

Changes your Content-Type header:

	Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryLqxk62ALAzpDVmHg
	
It also effects the way the form is transferred to the server:

	------WebKitFormBoundaryLqxk62ALAzpDVmHg
	Content-Disposition: form-data; name="user[name]"

	Dave Hoover
	------WebKitFormBoundaryLqxk62ALAzpDVmHg
	Content-Disposition: form-data; name="user[photo]"; filename="dave.png"
	Content-Type: image/png


	------WebKitFormBoundaryLqxk62ALAzpDVmHg--
	
When the form is submitted, it will read in the data and submit it to the server, where a new file will be created.

## CarrierWave

CarrierWave is the gem we will use to help manage uploading files to the server.  It works with multiple file formats, but is used most with images because it can create different versions of images to use as thumbnails, profile pic by interfacing with MiniMagick.

Follow the code example included in this repo for setup.

## Sinatra

Once CarrierWave has been set up, you can create models with images just as you would any other model.  An example POST route would look like this:

	post '/' do
  	  user = User.new(params[:user])
  	  if user.save
    	redirect to '/'
  	  else
    	erb :new
  	  end
	end



