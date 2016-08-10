class BankAccount
	attr_reader :account, :check_balance, :save_balance
	@@no_of_accounts = 0
	def initialize
		@account = generate_acct()
		@check_balance = 0
		@save_balance = 0
		@interest_rate = 2
		@@no_of_accounts += 1
	end
	def self.no_of_accounts
		@@no_of_accounts
	end
	def account_num
		@account
	end
	def balance
		@check_balance + @save_balance
	end
	def checking_blnc
		@check_balance
	end
	def saving_blnc
		@save_balance
	end
	def check_deposit(amount)
		@check_balance += amount
		self
	end
	def save_deposit(amount)
		@save_balance += amount
		self
	end
	def save_to_check(amount)
		if amount < @save_balance
			@check_balance += amount
			@save_balance -= amount
		else
			puts "Insufficient Funds"
		end
		self
	end
	def check_to_save(amount)
		if amount < @check_balance
			@save_balance += amount
			@check_balance -= amount
		else
			puts "Insufficient Funds"
		end
		self
	end
	def withdraw_save(amount)
		if amount < @save_balance
			@save_balance -= amount
		else
			puts "Insufficient Funds"
		end
		self
	end
	def withdraw_check(amount)
		if amount < @check_balance
			@check_balance -= amount
		else
			puts "Insufficient Funds"
		end
		self
	end
	def account_information
		str = "ACCOUNT INFORMATION:"
		str += "\nAccount Number: " + account_num.to_s
		str += "\nTotal Balance: " + balance.to_s
		str += "\nChecking Balance: " + checking_blnc.to_s
		str += "\nSavings Balance: " + saving_blnc.to_s
		str += "\nInterest Rate: " + @interest_rate.to_s + "%"
	end
	private
	def generate_acct
		10.times.map{rand(0..9)}.join('').to_i
	end

end

wells = BankAccount.new
puts wells.account_num
puts wells.check_deposit(100).checking_blnc
puts wells.balance
puts wells.check_to_save(25).saving_blnc
puts wells.checking_blnc
puts wells.balance
puts wells.withdraw_check(20).checking_blnc
puts wells.balance
puts wells.account_information
puts "Total Accounts for Class: " + BankAccount.no_of_accounts.to_s