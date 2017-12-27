class Product

  attr_reader :price, :amount, :title

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @title = params[:title]
  end

  def to_s
    "#{@price} руб. (Осталось #{@amount})"
  end
end

