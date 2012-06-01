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
    if env['REQUEST_METHOD'] != 'POST'
      return [405,{},"Method Not Allowed - must use POST\n"]
    end
    if not env['params'].has_key?('file')
      return [400,{},"Bad Request - must include a file\n"]
    end
    upload = env['params']['file'][:tempfile].path
    new_path = './uploads/' + env['params']['file'][:filename]
    FileUtils.mkdir 'uploads' unless File.directory?('./uploads')
    FileUtils.move(upload,new_path)
    [200, {}, "Upload Successful\n"]
  end
end
