class Book < Product

  attr_accessor :author, :genre, :title

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp}

    self.new(
        title: lines[0],
        genre: lines[1],
        author: lines[2],
        price: lines[3].to_i,
        amount: lines[4].to_i
    )
  end

  def initialize(params)
    super
    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @author = params[:author] if params[:author]
    @genre = params[:genre] if params[:genre]
  end
end