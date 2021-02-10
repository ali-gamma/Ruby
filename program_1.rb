#1. Write a Ruby program to check whether a given value appears everywhere in a given array. A value is "everywhere" in an array if it presents for #every pair of adjacent elements in the array.

array_1 = []
while true
	puts "enter array elements"
	ele = gets.chop.to_s
	if ele ==""
		break
	end
	array_1.push(ele)
end

puts "Enter element to search"
x = gets.chop.to_s
i=0
for i in 0...array_1.length-1 
	if array_1[i] != x && array_1[i+1] != x
		puts "The element is not everywhere"
		break
			
	end
end
if i == array_1.length-2
	puts "Element is everywhere!"
end	
=begin	
Case:1



enter array elements
1
enter array elements
2
enter array elements
1
enter array elements
1
enter array elements
1
enter array elements

Enter element to search
1
Element is everywhere!



Case : 2


enter array elements
1
enter array elements
2
enter array elements
1
enter array elements
2
enter array elements
2
enter array elements
2
enter array elements
1
enter array elements

Enter element to search
1
The element is not everywhere
=end
