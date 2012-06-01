This repo holds various small explorations
of the Goliath webserver (http://goliath.io).

###simple_uploader.rb
A simple server that accepts HTTP POST requests that
contain file uploads, and writes them to an 'uploads'
directory.

To use it:

    ruby simple_uploader.rb -sv
    curl -F file=@your_file.txt http://localhost:9000
