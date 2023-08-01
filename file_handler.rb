require_relative 'file_types'
require 'json'

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

  def save
    Dir.mkdir(@path.to_s) unless Dir.exist?(@path)

    File.write("#{@path}#{@filename}", JSON.generate(@data, { max_nesting: false }))
  end
end
