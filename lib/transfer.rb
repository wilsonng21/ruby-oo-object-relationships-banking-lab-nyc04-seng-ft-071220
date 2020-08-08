require 'pry'


class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending" 
    @amount = amount
  end

  def valid?
    self.receiver.valid? == self.sender.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance > self.amount 
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      # binding.pry
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    # binding.pry
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end
  
end