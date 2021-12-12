require 'spec_helper'
require 'log_file_reader'

RSpec.describe LogFileReader do
  subject { LogFileReader.new('spec/fixtures/example.log') }

  context 'each_pair' do
    it 'iterates over each line' do
      result = []

      subject.each_pair do |path, address|
        result += [path, address]
      end

      expect(result.size).to eql(12)
    end
  end
end
