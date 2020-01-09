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
    stat = @status
    if self.valid?
      @sender.balance -= @amount
      @receiver.balance+=@amount
      stat = 'complete'
    else
      return "Transaction rejected. Please check your account balance."
    end
    @status = stat
    @@all << self
  end
end
      
    
end
