require_relative 'file_types'

class FileHandler
  include FileTypes
  def initialize(type, data)
    @path = 'data/'
    @filename = get_filename(type)
    @data = data
  end

  def exists?
    File.exist?("#{@path}#{@filename}")
  end

  def empty?
    File.empty?("#{@path}#{@filename}")
  end
end
