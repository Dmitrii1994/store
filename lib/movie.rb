class Movie < Product

  attr_reader :year, :director

  def initialize(params)
    super
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм «#{title}», #{@year}, реж.#{@director}, #{super}"
  end

end