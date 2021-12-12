require 'spec_helper'
require 'weblog_parser'


RSpec.describe 'WeblogParser' do
  subject { WeblogParser.new('spec/fixtures/example.log') }

  context 'initialize' do
    it 'has log file reader' do
      expect(subject.log_file_reader).to be_an_instance_of(LogFileReader)
    end
  end

  context 'parse!' do
    before { subject.parse! }

    it 'creates page views with paths and addresses' do
      expect(subject.page_views.size).to eql 4
    end
  end
end
