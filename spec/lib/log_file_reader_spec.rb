require 'spec_helper'
require 'log_file_parser'

RSpec.describe 'LogFileParser' do
  subject { LogFileParser.new('spec/fixtures/example.log') }

  context 'each_pair' do
    it 'iterates over each line' do
      result = []

      subject.each_pair do |path, address|
        result += [path, address]
      end

      expect(result.size).to eql(10)
    end
  end
end
