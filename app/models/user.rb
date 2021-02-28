class User < ActiveRecord::Base
	has_many :payments, :dependent => :destroy
	has_many :bills, :through => :payments


	def total_paid
		payments.sum("amount")
	end

	def actual_pay
		sum = 0
		bills_with_payments = bills.includes(:payments)
		bills_with_payments.each do |bill|
			sum += bill.total_amount / bill.payments.length
		end
		sum
	end	

	def balance
		actual_pay- total_paid
	end
end
