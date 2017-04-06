require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(disc = 0)
    @total = 0
    @discount = disc
    @items = []
    @trans_count = 1
    @trans_hsh = {}
  end

  def add_item(name, price, qty = 1)
    @name = name
    @price = price
    @qty = qty
    @total += (price * qty)
    qty.times {@items << name}
    transaction_log(name, price, qty)

  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    @total = (@total * (100 - @discount)) / 100
    "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    last = []
    last = @trans_hsh[@trans_hsh.keys.sort[-1]]
    @items.pop(last[2])
    @total -= (last[1] * last[2])
    @trans_hsh.delete(@trans_hsh.keys.sort[-1])
    @trans_count -= 1
  end

  def transaction_log(name, price, qty)
    @trans_hsh[@trans_count] = [name, price, qty]
    @trans_count += 1


  end

end
