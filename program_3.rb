#3. Write a Ruby program to accept a filename from the user and print the extension of that.
puts "Enter File Name   "
name = gets.chop.to_s

i = name.index(".")
if i== 0 
  puts "No Extension"
end
puts "File extension is :  "+name[i..-1]

=begin

Case : 1

Enter File Name   
readme.txt
File extension is :  .txt

Case : 2

Enter File Name   
abc.1123v
File extension is :  .1123v

=end

