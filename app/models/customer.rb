require 'couchrest_model'
require 'Address'

class Customer < CouchRest::Model::Base
include ActiveModel::Model

	attr_accessor :surname,				:string
	attr_accessor :firstname,			:string
	property :address, 						Address
	timestamps!

	validates_presence_of :surname
	validates_presence_of :firstname
	#validates_presence_of :address

  def to_s
	    name_str = "#{surname}, #{firstname}\n#{address}"
	end

	design do
    	view :by_surname
  end
end
