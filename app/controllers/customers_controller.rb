class CustomersController < ApplicationController
	def new
		@customer = Customer.new(:surname => 'Ripke')
		@address = Address.new()
		@customer.firstname = 'Steffen'
		@address.line_1 = 'Pitzlinger Str. 1b'
		@address.zip_code = '86932'
		@address.city = 'Ummendorf'
		@address.state = 'Bayern'
		@customer.address = @address
		Rails.logger.debug 'DEBUG: Customer name is ' + @customer.inspect
		@customer.save
	end

	def get
		@customer = Customer.first
		Rails.logger.debug 'DEBUG: Customer name is ' + @customer.inspect
	end
end