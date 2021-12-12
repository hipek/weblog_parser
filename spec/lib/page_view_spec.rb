require 'spec_helper'
require 'page_view'

RSpec.describe PageView do
  subject { PageView.new("/about") }
  context "add_address" do
    before { subject.add_address("18.20.22.30") }

    it "adds address to collection" do
      expect(subject.addresses).to eq ["18.20.22.30"]
    end

    it "updates count to 1" do
      expect(subject.count).to eq 1
    end

    context "second address" do
      before { subject.add_address("18.20.22.33") }

      it "updates count to 2" do
        expect(subject.count).to eq 2
      end
    end

    context "second uniq address" do
      before { subject.add_address("18.20.22.30") }

      it "update uniq count and count" do
        expect(subject.count).to eq 2
        expect(subject.uniq_count).to eq 1
      end
    end
  end
end
