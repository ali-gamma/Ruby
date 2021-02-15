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

class Exempt

  attr_accessor :quantity,:price,:name,:tax

  def initialize( quantity , price , name)
    @quantity = quantity
    @price = price
    @name = name
    @tax = 1
		
  end
	
end

class Taxed

  attr_accessor :quantity,:price,:name,:tax

  def initialize( quantity , price , name)
    @quantity = quantity
    @price = price
    @name = name
    @tax = 1.10
  end

end

$final_output = []
$no_tax = %w(chocolate chips snacks cake muffins pill tablet injection book)
#add any keywords associated with tax exemption to $no_tax array
$words = []

class Bill

  @@amount = 0
  @@taxes = 0

  def initialize(quantity , price , name , imported)  
    @quantity = quantity
    @price = price
    @name = name
    @imported = imported
    @obj1 = Taxed.new(quantity , price , name)
    @name = " " + name
    
    for item in $no_tax        
      @obj1 = Exempt.new(quantity , price , name) if name.index(item)
    end

    @total = 0
    @taxes = 0
  end	

  def taxes()
    tax = @obj1.tax
    sales_tax = 0
    tax += 0.05 if @imported == true
    if @obj1.tax == 1.0 and @imported == false
    	@total = @obj1.price
    else    
      temp = tax * @obj1.price
      temp -= @obj1.price
      temp *= 20
      sales_tax =  temp.round(0) / 20.0
      @total = @obj1.price + sales_tax      
    end
    @@amount += @total
    @@taxes += sales_tax				
  end

  def add_line() 
    taxes()
    price_sum = @quantity.to_s + "  " + @name + "  :" + @total.round(2).to_s
    $final_output.push(price_sum)
  end
  
  def self.total_tax()
    @@taxes
  end
  
  def self.checkout()
    @@amount
  end

end

puts "Enter all items purchased"

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
  
  if quantity <= 0 or price < 0
    puts "Input is not valid"
    break
  end
  
  name = words.join(" ")
  imported = false 
  imported = true if words.include?("imported")
  item_bill = Bill.new(quantity,price,name,imported)
  item_bill.add_line()  
end

for item in $final_output
  puts item
end

puts "Sales Taxes  :  " + Bill.total_tax.round(2).to_s
puts "Total    :    " + Bill.checkout.round(2).to_s


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
	
	
	
