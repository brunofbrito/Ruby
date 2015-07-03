class Transaction
  def initialize(amount)
    @amount = amount
    @date = Time.now
  end

  def to_s
    # Nicely print transaction infos using Time#strftime.
    "#{@amount} euros on #{@date.strftime("%d/%m/%y at%l:%M%P")}"
  end
end