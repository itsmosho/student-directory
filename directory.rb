@width = 50

@students = []

@cohorts = {
  January: 15,
  February: 25,
  March: 25,
  April: 20,
  May: 10,
  June: 25,
  July: 25,
  August: 15,
  September: 0,
  October: 0,
  November: 0,
  December: 8
}


def create_new_student
  puts "Do you want to create a new student? (y/n)".center(@width)
  continue = gets.chomp.downcase
  if continue == "y"
    return true
  elsif continue == "n"
    return false
  else 
    puts "Invalid choice".center(@width)
  end
  create_new_student
end

def add_cohort
  next_cohort = :December
  puts
  puts "Available cohorts:".center(@width)
  puts "(Month / Vacancies)".center(@width)
  month_number = 1
  @cohorts.each do |month, vacancies|
    puts "(#{month_number}) #{month} - vacancies: #{vacancies}".center(@width)
    month_number += 1
  end
  puts
  puts "Please enter the month number of the cohort they would like to join".center(@width)
  cohort = gets.chomp
  case cohort
  when "1"
    cohort = :January
  when "2"
    cohort  = :February
  when "3"
    cohort = :March
  when "4"
    cohort = :April
  when "5"
    cohort = :May
  when "6"
    cohort = :June
  when "7"
    cohort = :July
  when "8"
    cohort = :August
  when "9"
    cohort = :December
  when "10"
    cohort = :December
  when "11"
    cohort = :December
  when "12"
    cohort = :December
  when ""
    puts "No input, the upcoming #{next_cohort} cohort will be added".center(@width)
    cohort = next_cohort
  else 
    puts "Input not recognised, the upcoming #{next_cohort} cohort was added".center(@width)
  end
  cohort
end
  
def input_students
  continue = create_new_student
  while continue
    puts "Please enter the name of the student".center(@width)
    name = gets.chomp
    cohort = add_cohort
    puts "Please enter the country of birth".center(@width)
    country_of_birth = gets.chomp
    hobbies = add_hobbies
    @students << { name: name, cohort: cohort.to_sym, country_of_birth: country_of_birth, hobbies: hobbies }
    puts "Now we have #{@students.count} students".center(@width)
    continue = create_new_student
  end
  @students
end

def add_hobbies
  hobbies = []
  puts "Please enter student's hobbies".center(@width)
  puts "(To finish, just hit return twice)".center(@width)
  hobby = gets.chomp
  while !hobby.empty?
    hobbies << hobby
    hobby = gets.chomp
  end
  hobbies
end
def print_header
  if !@students.empty?
  puts "The students of Villains Academy".center(@width)
  puts "--------------".center(@width)
  end
end

def print(students)
  if students.empty?
    puts "no students available".center(@width)
  else
    i = 0
    while i < @students.count
      puts "#{i + 1}.#{@students[i][:name]}, #{@students[i][:country_of_birth]} (#{@students[i][:cohort]})".center(@width)
      i += 1
    end
  end
end

def print_by_first_letter(students)
  puts "Student names beginning with: (Please enter a letter)".center(@width)
  letter = gets.chomp
  number_of_matches = 0
  students.each do |student|
    if student[:name].start_with?(letter.upcase, letter.downcase)
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(@width)
      puts "#{student[:name]}, #{students[i][:country_of_birth]} (#{student[:cohort]} cohort)".center(@width)
      number_of_matches += 1
    else
    end  
  end
  puts
  puts "We have #{number_of_matches} students whose name begins with #{letter}".center(@width)
  puts
end

def print_by_name_length(students)
  if @students.empty?
    puts "No students available".center(@width)
  else
  puts "Names with maximum characters of: (Please enter a number)".center(@width)
  max_length = gets.strip
  number_of_matches = 0
  @students.each do |student|
    if student[:name].length <= max_length.to_i
      puts "#{student[:name]}, #{students[i][:country_of_birth]} (#{student[:cohort]} cohort)".center(@width)
      number_of_matches += 1
    else
    end
  end
  end
  puts
  puts "We have #{number_of_matches} students with a name of maximum #{max_length} characters".center(@width)
  puts
end

def print_footer(students)

  puts "Overall, we have #{students.count} great students".center(@width)
end


students = input_students
print_header
print(students)
print_footer(students)