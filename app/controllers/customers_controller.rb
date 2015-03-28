class CustomersController < ApplicationController
	def new
		@customer = Customer.new()
	end

	def get
		@customer = Customer.first
		Rails.logger.debug 'DEBUG: Customer name is ' + @customer.inspect
	end
end