# Let's put all students into an array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Rathed",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffery Baratheon",
    "Norman Bates"
    ]
    
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
# finally, we print the total
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)