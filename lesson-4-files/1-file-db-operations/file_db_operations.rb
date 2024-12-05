# frozen_string_literal: true

require 'fileutils'

FILE_NAME = 'db.txt'

def ensure_file_exists
  File.write(FILE_NAME, '') unless File.exist?(FILE_NAME)
end

# Prints all file lines
def index
  ensure_file_exists
  File.foreach(FILE_NAME).each do |line|
    puts line
  end
end

# Prints file line with the specified id
def find(id)
  ensure_file_exists
  File.foreach(FILE_NAME).with_index do |line, i|
    if i == id
      puts line
      break
    end
  end
end

# Prints all file lines with the specified pattern
def where(pattern)
  ensure_file_exists
  File.foreach(FILE_NAME).with_index do |line, i|
    puts line if line.include? pattern
  end
end

# Updates file line with the specified id
def update(id, new_value)
  ensure_file_exists
  buffer_file = File.open("buffer_#{FILE_NAME}", 'w')
  File.foreach(FILE_NAME).with_index do |line, i|
    buffer_file.puts(id == i ? new_value : line)
  end

  FileUtils.mv(buffer_file, FILE_NAME)
  buffer_file.close
end

# Deletes file line with the specified id
def delete(id)
  ensure_file_exists
  buffer_file = File.open("buffer_#{FILE_NAME}", 'w')
  File.foreach(FILE_NAME).with_index do |line, i|
    buffer_file.puts(line) if i != id
  end

  FileUtils.mv(buffer_file, FILE_NAME)
  buffer_file.close
end

# Appends a new line to the end of file
def create(value)
  ensure_file_exists
  file = File.open(FILE_NAME, 'a')
  file.puts(value)
  file.close
end
