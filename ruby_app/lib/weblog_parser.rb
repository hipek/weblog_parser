require_relative 'log_file_reader'
require_relative 'page_view'


class WeblogParser
  attr_reader :log_file_reader, :page_views

  def initialize(file_path)
    @log_file_reader = LogFileReader.new(file_path)
  end

  def parse!
    @page_views = {}.tap do |pv|
      log_file_reader.each_pair do |path, address|
        pv[path] ||= PageView.new(path)
        pv[path].add_address(address)
      end
    end
  end

  def sorted_by_page_views
    page_views.values.sort_by(&:count).reverse
  end

  def sorted_by_uniq_page_views
    page_views.values.sort_by(&:uniq_count).reverse
  end

  def display_results
    puts "List of webpages with most page views:"
    sorted_by_page_views.each do |page_view|
      puts [page_view.path, page_view.count].join(" ")
    end
    puts "List of webpages with most unique page views:"
    sorted_by_uniq_page_views.each do |page_view|
      puts [page_view.path, page_view.count].join(" ")
    end
  end
end
