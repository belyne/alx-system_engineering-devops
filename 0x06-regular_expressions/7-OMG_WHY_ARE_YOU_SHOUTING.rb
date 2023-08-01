#!/usr/bin/env ruby

def match_capital_letters(text)
  # Regular expression to match only capital letters
  regex = /[A-Z]/

  # Use the `scan` method to find all occurrences of the regex pattern in the text
  matches = text.scan(regex).join

  # Output the matched result
  puts matches
end

# Accept one argument from the command line
if ARGV.length != 1
  puts "Usage: #{$PROGRAM_NAME} <text>"
  exit 1
end

# Call the match_capital_letters method with the provided argument
match_capital_letters(ARGV[0])
