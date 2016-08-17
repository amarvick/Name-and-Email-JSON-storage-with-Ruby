require 'json'

class User
  attr_accessor :name, :email, :permissions

  def initialize(*args) # * = Splat operator; takes arguments passed in to create an array. args[0] = name, args[1] = email, args[2] = password
  	@name = args[0]
  	@email = args[1]
  	@permissions = User.permissions_from_template
  end

  def self.permissions_from_template
  	file = File.read 'rubyjson.json' #Providing the file which it will read from
  	JSON.load(file, nil, symbolize_names: true) #(file, proc, options (symbolize names returns as JSON object; otherwise, string))... 
  												#loading this data structure.
  end

  def save #Will save the name and email in to a new file
  	self_json = {name: @name, email: @email, permissions: @permissions}.to_json #converts input in to json
  	
  	open('users.json', 'a') do |file| #appends all the json in to the file
  	  file.puts self_json
  	end
  end
end