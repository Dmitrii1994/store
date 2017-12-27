if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'

current_path = File.dirname(__FILE__)
movie = Movie.from_file(current_path + '/data/movies/01.txt')
book = Book.from_file(current_path + '/data/books/01.txt')

puts movie
puts book