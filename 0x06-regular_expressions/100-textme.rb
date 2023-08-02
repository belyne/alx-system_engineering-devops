#!/usr/bin/env ruby

# Function to extract sender, receiver, and flags from the log message
def extract_data(log_message)
  sender = log_message.scan(/\[from:(\S+)\]/).flatten.first
  receiver = log_message.scan(/\[to:(\S+)\]/).flatten.first
  flags = log_message.scan(/\[flags:(.*?)\]/).flatten.first
  "#{sender},#{receiver},#{flags}"
end

# Check if the log file path is provided as a command-line argument
if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <log_file_path>"
  exit(1)
end

# Read log file and process each line
def process_log_file(file_path)
  File.open(file_path).each do |line|
    if line =~ /Receive SMS|Sent SMS/
      result = extract_data(line)
      puts result unless result.empty? # Only print if there's a valid result
    end
  end
end

# Execute the script with the provided log file path
log_file_path = ARGV[0]
process_log_file(log_file_path)
