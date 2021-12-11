#!/usr/bin/env ruby

$LOAD_PATH << File.dirname(__FILE__)
require "lib/weblog_parser"

parser = WeblogParser.new(ARGV[0])
parser.parse!
parser.dispaly
