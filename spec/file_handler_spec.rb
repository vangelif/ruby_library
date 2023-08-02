require_relative '../file_handler'
require_relative '../book'

require 'fileutils'

describe FileHandler do
  describe 'creates a FileHander instance' do
    it 'using type and path parameters' do
      FileUtils.rm_rf('spec/data')
      fh = FileHandler.new(:book, 'spec/data')
      expect(fh).to be_an_instance_of FileHandler
    end

    it 'using type, path and data parameters' do
      FileUtils.rm_rf('spec/data')
      books = []
      books << Book.new(title: 'book1', author: 'author1')
      books << Book.new(title: 'book2', author: 'author2')
      books << Book.new(title: 'book3', author: 'author3')
      books << Book.new(title: 'book4', author: 'author4')
      fh = FileHandler.new(:book, 'spec/data', books)
      expect(fh).to be_an_instance_of FileHandler
    end
  end

  describe 'checks if a file exists in a given path' do
    it 'file_exist? return false if a file does not exist' do
      FileUtils.rm_rf('spec/data')
      fh = FileHandler.new(:book, 'spec/data')
      expect(fh.file_exist?(fh.full_path)).to be_falsy
    end

    it 'file_exist? return true if a file exist' do
      FileUtils.rm_rf('spec/data')
      books = []
      books << Book.new(title: 'book1', author: 'author1')
      fh = FileHandler.new(:book, 'spec/data', books)
      fh.save
      expect(fh.file_exist?(fh.full_path)).to be_truthy
    end
  end

  describe 'check if a file is empty' do
    it 'file_empty? return true if a file is empty' do
      FileUtils.rm_rf('spec/data')
      fh = FileHandler.new(:book, 'spec/data')
      FileUtils.mkdir_p('spec/data')
      FileUtils.touch('spec/data/books.json')
      expect(fh.file_empty?(fh.full_path)).to be_truthy
    end

    it 'file_empty? return false if a file is empty' do
      FileUtils.rm_rf('spec/data')
      books = []
      books << Book.new(title: 'book1', author: 'author1')
      fh = FileHandler.new(:book, 'spec/data', books)
      fh.save
      expect(fh.file_empty?(fh.full_path)).to be_falsy
    end
  end
end
