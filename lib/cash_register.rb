require 'pry'
class CashRegister
    # @@all = []
    attr_accessor :total , :discount
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @previous_total = []

    end 

    def instance_variable_get= (new_total)
        @total = new_total
    end 

    def add_item (item, price, quantity=1)
        counter = 0 
        @total += (price*quantity)
        @previous_total << (price*quantity)
        while counter < quantity
            @items << item
            counter += 1
        end 
    end 
    # binding.pry
    def apply_discount
       if (self.discount > 0 )
        # binding.pry
            @total -= @total.to_f * ((@discount.to_f)/100)
            "After the discount, the total comes to $#{@total.to_i}."  
       else
            "There is no discount to apply."
       end
    end 

    def items 
        @items
        # binding.pry 
    end 

    def void_last_transaction 
        if (@previous_total.length > 0 )
            last = @previous_total.pop()
            @total -= last          
            @total
            return 
        end 
        @total
        # binding.pry
    end 

end 

