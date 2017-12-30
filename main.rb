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
require_relative 'lib/disk'
require_relative 'lib/product_collection'

both = []


collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)
loop do
  puts "Что вы хотите купить:"
  puts "=" * 80
  collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
    puts "-" * 80
  end
  puts "=" * 80
  puts  "0. Выход"
  choice = STDIN.gets.chomp.to_i - 1
  break if  choice == -1
  current_item = collection.buy_item(choice)
  both << current_item
  puts "-" * 80
  puts "Вы выбрали: #{current_item}"
  puts "-" * 80
  puts "Всего товаров на сумму: #{both.sum(&:price)} руб."
end

puts "Вы купили:"
both.each do |product|
  puts product
end
puts "=" * 80

puts "С вас - #{both.sum(&:price)} руб.Спасибо за покупку."
puts "=" * 80
