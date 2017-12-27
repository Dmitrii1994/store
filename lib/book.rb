class Book < Product

  attr_reader :author, :genre

  def initialize(params)
    super
    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    "Книга «#{title}», #{@genre}, автор — #{@author}, #{super}"
  end

end