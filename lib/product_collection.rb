class ProductCollection

  PRODUCT_TYPES = {
      movie: {dir: 'movies', class: Movie},
       book: {dir: 'books', class: Book},
       disk: {dir: 'disk', class: Disk}
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end
    self.new(products)
  end

  def to_a
    @products
  end

  def buy_item(item_index)
    bought_item = @products[item_index]
    bought_item.amount -= 1

    @products.delete_at(item_index) if bought_item == 0

    bought_item
  end

  def sort!(params)
    case params[:by]
      when :title
        @products.sort_by! { |product| product.to_s }
      when :price
        @products.sort_by! { |product| product.price }
      when :amount
        @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :asc
    self
  end
end