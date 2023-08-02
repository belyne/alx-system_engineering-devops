#!/usr/bin/env ruby

def match_repetition_token(text)
  # Regular expression to match the patterns 'hbbn', 'hbttttttttttn', or 'hbtn' in the given text
  regex = /hb+n|hbt+n/

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

# Call the match_repetition_token method with the provided argument
match_repetition_token(ARGV[0])
