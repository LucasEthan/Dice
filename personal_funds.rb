class PersonalFunds
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def deduct(amount)
    self.balance -= amount
  end

  def add(amount)
    self.balance += amount
  end

  def balance_in_euros
    balance / 100.to_f
  end

  def zero_balance?
    balance.zero?
  end

  private

  attr_writer :balance
end
