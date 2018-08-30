class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if !artist.nil?
    self.genre = genre if !genre.nil?
    @@all << self
  end

  def self.all
    @@all.uniq
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_or_create_by_name(name)
    find_by_name(name)
    create_by_name(name) if @@all.include?(name) == false
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

end
