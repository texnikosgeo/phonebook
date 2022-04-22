#!/usr/bin/env ruby

loop do
puts "Choose Option:
1. View All Entries
2. Add New Entry
3. Find And Search
4. Delete Entry
5. Exit
"

nsr = gets.chomp.to_i

  if nsr == 1
  fileobject = File.open("/home/geo/Documents/playgroound/phonebook/phonebook.entries", "r")
  print(fileobject.read)
  fileobject.close()
  puts ""
  print `wc -l /home/geo/Documents/playgroound/phonebook/phonebook.entries`
  puts "Total contacts"
  puts ""

  elsif nsr == 2
  puts "name:"
  name = gets.chomp
  puts "tel:"
  tel = gets.chomp

  fileobject = File.open("/home/geo/Documents/playgroound/phonebook/phonebook.entries", "a")
  fileobject.write("#{name}, #{tel}\n")
  fileobject.close()
  puts "Saved!"

  elsif nsr == 3
  puts "search for:"
  trgt = gets.chomp

  system("cat /home/geo/Documents/playgroound/phonebook/phonebook.entries | grep -i #{trgt}")

  elsif nsr == 4
  puts "Contact to Delete:"
  trgt = gets.chomp
  puts `grep -v "#{trgt}" /home/geo/Documents/playgroound/phonebook/phonebook.entries > /home/geo/Documents/playgroound/phonebook/temp.txt`
  puts `mv /home/geo/Documents/playgroound/phonebook/temp.txt /home/geo/Documents/playgroound/phonebook/phonebook.entries` 
  puts "Lines with #{trgt} Deleted."

  else
  break if nsr == 5
  puts "bye !"

  end

end

