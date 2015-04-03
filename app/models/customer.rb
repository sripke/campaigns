require 'couchrest_model'
require 'Address'

class Customer < CouchRest::Model::Base

	property :surname,      String
	property :firstname,  	String
	property :address, 		Address
	timestamps!

  	def to_s
	    name_str = "#{surname}, #{firstname}\n#{address}"
	end

	design do
    	view :by_surname
    end

end