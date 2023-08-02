require_relative 'file_types'
require 'json'
require 'pry'

class FileHandler
  include FileTypes
  def initialize(type, data_folder, data = [])
    @data_folder = data_folder
    @data_filename = get_filename(type)
    @data_type = type
    @data = data
  end

  def parse_obj(params)
    type = params[:type]
    line = params[:line]
    books = params[:books]
    persons = params[:persons]

    return type.from_json(line) if books.nil? && persons.nil?

    type.from_json(line, books, persons)
  end

  def full_path
    "#{@data_folder}/#{@data_filename}"
  end

  def read_file(path)
    File.read(path)
  end

  def write_file(path, content)
    File.write(path, content)
  end

  def make_dir(path)
    Dir.mkdir(path)
  end

  def dir_exist?(path)
    Dir.exist?(path)
  end

  def file_exist?(path)
    File.exist?(path)
  end

  def file_empty?(path)
    File.empty?(path)
  end

  def save
    make_dir(@data_folder) unless dir_exist?(@data_folder)

    file_content = @data.map { |obj| JSON.generate(obj, { max_nesting: false }) }
    write_file(full_path, file_content.join("\n"))
  end

  def check_type(line)
    return get_objtype(:teacher) if line.include?('Teacher')

    return get_objtype(:student) if line.include?('Student')

    get_objtype(@data_type)
  end

  # load method has books and persons as optional parameters
  #   it will receive a books array and a persons array
  #   when we are loading the rentals.json file
  def load(*params)
    # return empty array if file does not exist
    # or if file exists but is empty
    return [] unless file_exist?(full_path)
    return [] if file_empty?(full_path)

    # we read the file
    file = read_file(full_path)

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
      args = {
        books: params[0],
        persons: params[1],
        type: object_type,
        line: line
      }
      parse_obj(args)
    end
  end
end
