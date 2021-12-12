class LogFileReader
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def each_pair
    File.open(self.file, "r") do |f|
      f.each do |line|
        yield *line.split(/\s+/)
      end
    end
  end
end
