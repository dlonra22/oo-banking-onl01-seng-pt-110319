class Transfer
  # your code here
    attr_accessor :sender, :receiver, :status, :amount
    
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
    @@all = []
  end
  
  def valid?
    (@sender.valid? && @receiver.valid? && (@sender.balance >= @amount)) ? true : false 
  end
  
  def execute_transaction
   if @@all == []
      @@all << self
      stat = @status
      if self.valid?
        @sender.balance -= @amount
        @receiver.balance+=@amount
        @status = "complete"
      else
        @status = "rejected"
      end
  end
  @status != "rejected" ? nil : "Transaction rejected. Please check your account balance."
end

  def reverse_transfer
    if @@all.include?(self)
      @sender.balance += @amount
      @receiver.balance-=@amount
      @status = "reversed"
    end
  end

end
