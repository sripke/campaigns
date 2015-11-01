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

	def create
		@customer = Customer.new(secure_params)
		if @customer.valid?
			# TODO send message
			flash[:notice] = "Message sent from #{@customer.surname}."
			redirect_to root_path
		else
			render :new
		end
	end

	def get
		@customer = Customer.first
		flash.now[:notice] = 'Customer name is ' + @customer.surname
	end

private

	def secure_params
		params.require(:customer).permit(:surname, :firstname)
	end

end
