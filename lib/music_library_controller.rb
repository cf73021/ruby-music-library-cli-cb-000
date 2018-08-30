class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    new_music = MusicImporter.new(path)
    new_music.import
  end

  def call
    puts "Welcome"
  end
end
