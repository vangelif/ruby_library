require_relative 'file_types'
require 'json'

class FileHandler
  include FileTypes
  def initialize(type, data = [])
    @path = 'data/'
    @filename = get_filename(type)
    @datatype = get_objtype(type)
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

# public

  def load
    # return empty array if file does not exist
    # or if file exists but is empty
    return [] unless exists? || (exists? && empty?)

    # we read the file
    parsed_file = JSON.load(File.read("#{@path}#{@filename}"))





    # parsed_file.map do |data|
    #     # p data
    #     @datatype = data[type] if data.is_a? Person
        
    #   @data.push(@datatype.new(data))
    # end
    # @data
  end
end
