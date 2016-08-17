require 'pp' #pretty print; styles output nicely. Optional.
require_relative 'user' # 'relative' because it's within the same folder. Pulls out user class from wherever it is located (in user.rb), so you can make
						# instances of the user class in this document.

user = User.new('Alex Marvick', 'amarvick94@gmail.com')

pp user

user.save #created in user.rb, will output in to a json object using name, email and permissions