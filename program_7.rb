#Read from a CSV file, multiple columns (minimum 2), and then write back to the CSV file.

cs = File.open("addresses.csv",'r+')
lines = cs.readlines
for line in lines
	puts line
end
new = ["Ali","Noor","NA","NA","NA"]

cs.syswrite(new)


=begin

John,Doe,120 jefferson st.,Riverside, NJ,8075
Jack,McGinnis,220 hobo Av.,Phila, PA,9119
John Da Man,Repici,120 Jefferson St.,Riverside, NJ,8075
["Ali", "Noor", "NA", "NA", "NA"]


=end
