#!/usr/bin/env ruby

def extract_data(log_line)
  # Regular expressions to extract the sender, receiver, and flags from the log line
  sender_regex = /\[from:(.*?)\]/
  receiver_regex = /\[to:(.*?)\]/
  flags_regex = /\[flags:(.*?)\]/

  sender = log_line[sender_regex, 1]
  receiver = log_line[receiver_regex, 1]
  flags = log_line[flags_regex, 1]

  "#{sender},#{receiver},#{flags}"
end

# Accept one argument from the command line: the log file path
if ARGV.length != 1
  puts "Usage: #{$PROGRAM_NAME} <log_file>"
  exit 1
end

# Read the log file
log_file_path = ARGV[0]
log_data = File.read(log_file_path)

# Process each log line and extract the required data
log_lines = log_data.split("\n")
log_lines.each do |log_line|
  result = extract_data(log_line)
  puts result unless result.empty?
end
