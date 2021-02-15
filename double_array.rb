#Use the map function to double all the elements in the array. However, handle edge cases (like array can have a character) as well.

array_1 = []
while true
  ele = gets.chomp
  break if ele == ""
  array_1.push(ele)
end
array_2 = array_1.map do |n|
  if n.match( '\d+' )
    n = 2 * n.to_i
  else
    n = n + n
  end
end	
puts array_2

=begin


1
2
3
c
a

2
4
6
cc
aa


=end
