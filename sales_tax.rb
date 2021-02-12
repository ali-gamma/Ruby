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
$no_tax = ["chocolate" , "chips" , "snacks" , "cake", "muffins" , "pill" , "tablet" , "injection" , "book" ]
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
		
      if name.index(item)
        
        @obj1 = Exempt.new(quantity , price , name)
      else
				
      end
    end
    @total = 0
    @taxes = 0

  end	

  def taxes()

    tax = @obj1.tax
    sales_tax = 0
    if @imported == true
      tax+=0.05
    else
			
    end

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
  
  if input == ""
    break
  end	

  words = input.split
  quantity = words[0].to_i
  words.delete_at(0)
  price = words[-1].to_f
  words.delete_at(-1)
  words.delete("at")
  name = words.join(" ")
  imported = false
  if words.include?("imported")
    imported = true
  else
  
  end
  
  item_bill = Bill.new(quantity,price,name,imported)
  item_bill.add_line()
  
end

for item in $final_output
  puts item
  
end

puts "Sales Taxes  :  " + Bill.total_tax.round(2).to_s
puts "Total    :    " + Bill.checkout.round(2).to_s

	
	
	
	
