class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    new_music = MusicImporter.new(path)
    new_music.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
  end
end
