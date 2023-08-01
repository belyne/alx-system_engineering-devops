#!/usr/bin/env ruby

def match_phone_number(text)
  # Regular expression to match a 10-digit phone number
  regex = /^\d{10}$/

  # Use the `match` method to find the first occurrence of the regex pattern in the text
  match = text.match(regex)

  # Output the matched result
  puts match ? match[0] : ""
end

# Accept one argument from the command line
if ARGV.length != 1
  puts "Usage: #{$PROGRAM_NAME} <text>"
  exit 1
end

# Call the match_phone_number method with the provided argument
match_phone_number(ARGV[0])
