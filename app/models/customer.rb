require 'couchrest_model'

class Customer < CouchRest::Model::Base

	property :surname,      String
	property :firstname,  	String

	design do
    	view :by_surname
    end

end