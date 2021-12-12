require_relative 'log_file_reader'
require_relative 'page_view'


class WeblogParser
  attr_reader :log_file_reader, :page_views

  def initialize(file_path)
    @log_file_reader = LogFileReader.new(file_path)
  end

  def parse!
    @page_views = {}.tap do |pv|
      self.log_file_reader.each_pair do |path, address|
        pv[path] ||= PageView.new(path)
        pv[path].add_address(address)
      end
    end
  end

  def sorted_by_page_views
    @page_views.values.sort_by(&:count).reverse
  end
end
