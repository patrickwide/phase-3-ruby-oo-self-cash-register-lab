
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = 0
    end
  
    def add_item(title, price, quantity = 1)
      @last_transaction = price * quantity
      @total += @last_transaction
      quantity.times { @items << title }
    end
  
    def apply_discount
      if @discount > 0
        @total -= (@total * (@discount.to_f / 100)).to_i
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      @total -= @last_transaction
      @total = 0 if @items.empty?  # If all items have been removed, reset total to 0
    end
  end
  