#Write a Ruby program to find the difference between the largest and smallest values of a given array of integers and length 1 or more.

array_1 = []
puts "Enter array"
while true
	ele = gets.chomp.to_i
	if ele == 0
		break
	end
	array_1.push(ele)
end
if array_1.length == 1
	puts array_1[0]
else
	array_1.sort
	diff = array_1[-1]-array_1[0]
	puts "The difference is  :  " + diff.to_s
	
end	
=begin

Enter array
1
2
3
55

The difference is  :  54

=end
