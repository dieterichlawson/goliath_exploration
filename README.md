This repo holds various small explorations of the Goliath webserver (http://goliath.io).

###simple_uploader.rb
Accepts an HTTP POST request that contains a file upload, and writes the file to an 'uploads' directory.

To use it:

    ruby simple_uploader.rb -sv
    curl -F file=@your_file.txt http://localhost:9000

Afterwards, `your_file.txt` will be in a directory called uploads in the same directory as simple_uploader.rb.
