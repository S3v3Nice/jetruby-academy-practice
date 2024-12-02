# frozen_string_literal: true

STUDENTS_FILE_NAME = 'students.txt'
RESULTS_FILE_NAME = 'results.txt'

def get_students_aged(age, student_lines)
  results = []
  student_lines.each do |line|
    split_line = line.chomp.split
    current_age = split_line[2].to_i

    results.push(line) if current_age == age
  end

  results
end

students = File.readlines(STUDENTS_FILE_NAME)
processed_ages = []
processed_students = []

File.open(RESULTS_FILE_NAME, 'w') do |file|
  loop do
    print 'Student age [-1 to quit]: '
    age = gets.chomp.to_i

    break if age == -1
    next if processed_ages.include? age

    students_aged = get_students_aged(age, students)
    processed_ages.push age
    processed_students.concat students_aged

    file.puts students_aged
    file.flush

    break if processed_students.length == students.length
  end
end

processed_students.each do |line|
  puts line.chomp
end
