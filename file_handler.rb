require_relative 'file_types'
require 'json'

class FileHandler
  include FileTypes
  def initialize(type, path, data = [])
    @path = path
    @filename = get_filename(type)
    @datatype = type
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

    file_content = @data.map { |obj| JSON.generate(obj, { max_nesting: false }) }
    File.write("#{@path}#{@filename}", file_content.join("\n"))
  end

  def check_type(line)
    return get_objtype(:teacher) if line.include?('Teacher')

    return get_objtype(:student) if line.include?('Student')

    get_objtype(@datatype)
  end

  # load method has books and persons as optional parameters
  #   it will receive a books array and a persons array
  #   when we are loading the rentals.json file
  def load(books = nil, persons = nil)
    # return empty array if file does not exist
    # or if file exists but is empty
    return [] unless exists? || (exists? && empty?)

    # we read the file
    file = File.read("#{@path}#{@filename}")

    # we split the files into lines, one line per object saved
    lines = file.split("\n")

    # return the generated objects
    lines.map do |line|
      object_type = check_type(line)

      # if books and person are 'nil'
      #   we will call from_json just with line as parameter
      #   this will happen with objects that are Book, Student or Teacher type
      # in case we receive and array of books and an array of persons
      #   we will call from_json with line, books and persons
      #   this will happen with objects that are Rental type
      books.nil? && persons.nil? ? object_type.from_json(line) : object_type.from_json(line, books, persons)
    end
  end
end
