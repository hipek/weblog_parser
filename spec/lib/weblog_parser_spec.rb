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

  context 'page views' do
    before { subject.parse! }

    context 'sorted by page view' do
      let(:sorted_page_views) { subject.sorted_by_page_views }

      it 'returns sorted list' do
        expect(sorted_page_views[0].path).to eql "/home"
        expect(sorted_page_views[0].count).to eql 3
      end
    end

    context 'sorted by uniq page views' do
      let(:sorted_page_views) { subject.sorted_by_uniq_page_views }

      it 'returns sorted list' do
        expect(sorted_page_views[0].path).to eql "/home"
        expect(sorted_page_views[0].uniq_count).to eql 2
      end
    end

    context "display results" do
      it do
        expect(subject).to receive(:puts).exactly(10).times
        subject.display_results
      end
    end
  end
end
