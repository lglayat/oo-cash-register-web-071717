require "pry"

class CashRegister

  attr_accessor :total, :discount, :items, :prev_trans


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      @items << title
    end

    @prev_trans = price * quantity

    quantity.times do
      @total += price
    end

  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      disc = @discount.to_f
      discount_percent = (1 - ( disc / 100 ))
      @total = @total * discount_percent
      @total = @total.to_i
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= prev_trans
  end



end
