class Disk < Product

  attr_accessor :album, :artist, :genre, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp}

    self.new(
        album: lines[0],
    artist: lines[1],
    genre: lines[2],
    year: lines[3],
    price: lines[4].to_i,
    amount: lines[5].to_i
    )

  end

  def initialize(params)
    super
    @album = params[:album]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом «#{@album}» —  #{@artist}, #{@genre}, #{year}, #{super}"
  end

  def update(params)
    @album = params[:album] if params[:album]
    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end