
class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize discount = 0
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = [nil,nil,nil]
  end

  def add_item title, price=0 ,quantity=1
    @total = @total + (quantity * price)
    # @items << title if !(@items.include? title)
    quantity.times do
      @items << title
    end
    @last_transaction = [title,price,quantity]
  end

  def apply_discount
    @total = @total - (@total * @discount / 100)
    @discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    if !@last_transaction[0].nil?
      @total = @total - @last_transaction[1] * @last_transaction[2]
      #remove from items
      quantity = @last_transaction[2]
      title = @last_transaction[0]
      quantity.times do
        index = @items.find_index title
        @items.delete_at index
      end
      #reset last_transaction
      puts "#{@items}"
      @last_transaction = [nil,nil,nil]
    end
  end

end
