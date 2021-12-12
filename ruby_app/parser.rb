#!/usr/bin/env ruby

$LOAD_PATH << File.dirname(__FILE__)
require "lib/weblog_parser"

if ARGV.size < 1
  puts "Input file required! Check README file for usage example."
  exit 1
end

parser = WeblogParser.new(ARGV[0])
parser.parse!
parser.display_results
