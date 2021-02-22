=begin

Basic sales tax is applicable at a rate of 10% on all goods, except books,
food, and medical products that are exempt. Import duty is an additional
sales tax applicable on all imported goods at a rate of 5%, with no
exemptions.

When I purchase items I receive a receipt which lists the name of all the
items and their price (including tax), finishing with the total cost of the
items, and the total amounts of sales taxes paid. The rounding rules for
sales tax are that for a tax rate of n%, a shelf price of p contains
(np/100 rounded up to the nearest 0.05) amount of sales tax.

=end

class Bill

  NO_TAX = %w(chocolate chips snacks cake muffins pill tablet injection book)
  #add any keywords associated with tax exemption to NO_TAX array
  @@amount = 0
  @@taxes = 0
  @@final_output = []
  
  def initialize(quantity, price, name, imported)  
    @quantity = quantity
    @price = price
    @name = name
    @imported = imported
    @name = " " + name
    @tax = 1.10
    NO_TAX.each {|item| @tax = 1.00 if name.index(item)}
    @total = 0
  end	

  def taxes
    sales_tax = 0
    @tax += 0.05 if @imported == true
    if @tax == 1.0 && @imported == false
    	@total = @price
    else    
      temp = @tax * @price
      temp -= @price
      temp *= 20
      sales_tax =  temp.ceil / 20.0
      @total = @price + sales_tax      
    end
    @@amount += @total
    @@taxes += sales_tax				
  end

  def add_line
    taxes
    price_sum = "#{@quantity} #{@name} : #{@total.round(2)}"
    @@final_output.push(price_sum)
  end
  
  def self.total_tax
    @@taxes
  end
  
  def self.checkout
    @@amount
  end

  def self.final_output
    @@final_output
  end
end

def main_loop
  puts "Enter all items purchased"
  final_output = Bill.final_output

  while true
    input = gets.chomp  
    break if input == ""
    words = input.split
    quantity = words[0].to_i
    words.delete_at(0)
    price = words[-1].to_f
    words.delete_at(-1)
    break unless words.include?("at")
    words.delete("at")
  
    if quantity <= 0 || price < 0
      puts "Input is not valid"
      break
    end
    
    name = words.join(" ")
    imported = false 
    imported = true if words.include?("imported")
    item_bill = Bill.new(quantity, price, name, imported)
    item_bill.add_line
  end

  final_output.each { |n| puts n }
  puts "Sales Taxes  :  " + Bill.total_tax.round(2).to_s
  puts "Total    :    " + Bill.checkout.round(2).to_s

end

main_loop
=begin

Sample Input :

Enter all items purchased
1 chocolate at 16.99
1 imported bicycle at 999.99
1 cold pills box at 49.99
5 books at 200.00

1   chocolate  :16.99
1   imported bicycle  :1149.99
1   cold pills box  :49.99
5   books  :200.0
Sales Taxes  :  150.0
Total    :    1416.97

=end	
