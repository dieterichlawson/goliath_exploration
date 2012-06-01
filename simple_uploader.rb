#!/usr/bin/env ruby

require 'goliath'
require 'fileutils'

class SimpleUploader < Goliath::API
  use Goliath::Rack::Params

  #Accept a POST request with an uploaded file passed as
  #the 'file' parameter. Stores the file in the 'uploads' dir.
  #If a file by the specified filename already exists, then
  #the existing file will be overwritten.
  def response(env)
    upload = env['params']['file'][:tempfile].path
    new_path = "./uploads/" + env['params']['file'][:filename]
    FileUtils.move(upload,new_path)
    [200, {}, "Upload Successful\n"]
  end
end
