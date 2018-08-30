class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    new_music = MusicImporter.new(path)
    new_music.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
  end
end
