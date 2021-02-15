# 2. Using hash table, print the frequency of occurrence of each character inside an array . 



array_1 = []
hash_1 = {}
while true
  puts "enter an element"
  ele = gets.chop.to_s
  break if ele ==""
  array_1.push(ele)
  hash_1[ele] = hash_1[ele]? hash_1[ele] + 1 : 1
end
	
for i in array_1.uniq
  puts "The element  " + i.to_s + "  occurs  " + hash_1[i].to_s + "  times"
end

=begin
enter an element
a
enter an element
b
enter an element
c
enter an element
1
enter an element
2
enter an element
1
enter an element
1
enter an element
a
enter an element
c
enter an element
d
enter an element

The element  a  occurs  2  times
The element  b  occurs  1  times
The element  c  occurs  2  times
The element  1  occurs  3  times
The element  2  occurs  1  times
The element  d  occurs  1  times
=end

