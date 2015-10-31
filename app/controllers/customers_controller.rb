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
		Rails.logger.debug 'DEBUG: Customer name is ' + @customer.to_s
		@customer.save
	end

	def get
		@customer = Customer.first
		flash.now[:notice] = 'Customer name is ' + @customer.surname
	end
end
