require "spec_helper"

require "weblog_parser"


RSpec.describe "WeblogParser" do
  subject { WeblogParser.new("spec/fixture/example.log") }

  context "initialize" do
    it "has file path" do
      expect(subject.file_path).to eq "spec/fixture/example.log"
    end
  end
end
