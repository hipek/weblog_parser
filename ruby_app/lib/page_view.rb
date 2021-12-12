class PageView
  attr_reader :path, :count, :uniq_count, :addresses

  def initialize(path)
    @path = path
    @addresses = []
    @count = 0
    @uniq_count = 0
  end

  def add_address(address)
    @addresses.append(address)
    @count = @addresses.size
    @uniq_count = @addresses.uniq.size
  end
end
