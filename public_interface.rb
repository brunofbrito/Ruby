require_relative "transaction"

# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)

  MIN_DEPOSIT =  100
  
  attr_reader :name, :position, :iban
  

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
  end

# Implement BankAccount#withdraw and BankAccount#deposit. 
# Both these methods should call the private BankAccount#add_transaction method (which is also called in the BankAccount#initialize). 
# These methods should return a message like "You've just withdrawn/deposit XXX euros".

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
      if amount <= @position 
        add_transaction(amount * -1)
        "You've just withdrawn #{amount} euros. Your total is #{@position}."
    else
       "Sorry, you don't have enough money."
      end
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
      if amount <= MIN_DEPOSIT
        "You tried to deposit #{amount} euros. That's no good, please deposit at least #{MIN_DEPOSIT} euros."
        # fail DepositError, "tried to deposit #{amount}€"
      else
      add_transaction(amount)
      "You've just made a deposit of #{amount} euros. Your total is #{@position}."
      end
  end

  def transactions_history(args = {})
    if args[:password] == nil
      "no password given"
    elsif args[:password] != @password
      "wrong password"
    else
      @transactions.join("\n")
    end
    # transaction history method so that it prints transactions like

    # + 200 euros on 22/10/13 at 8:30am
    # - 120 euros on 30/11/13 at 2:30pm
    # + 1050 euros on 30/11/13 at 2:30pm
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: Displays the account owner, the hidden iban and the position of the account
    "\nOwner: #{@name}\nIBAN: #{iban}\nCurrent amount: #{@position} euros"
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    @iban[0..3] + "*" * 26 + @iban[-3..-1]
  end
  
  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    # TODO: update the current position (which represents the balance of the account)
    @transactions << Transaction.new(amount)
    # "#{amount} euros on #{Time.now.strftime("%d/%m/%y at %l:%M%P")}"
    @position += amount
  end

end

account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")
account.deposit(300)
account.withdraw(100)
puts account.transactions_history({:password => "brucelit"})