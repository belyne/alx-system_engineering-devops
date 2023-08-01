#!/usr/bin/env ruby

def match_beginning_and_end(text)
  # Regular expression to match a string that starts with 'h', ends with 'n',
  # and can have any single character in between.
  regex = /^h.n$/

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

# Call the match_beginning_and_end method with the provided argument
match_beginning_and_end(ARGV[0])
