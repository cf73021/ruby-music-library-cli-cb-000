class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    new_music = MusicImporter.new(path)
    new_music.import
  end

  def call
    answer = nil
    while answer != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets.chomp
    end
  end

  def list_songs
    sorted_songs = Song.all.sort {|song_a,song_b| song_a.name <=> song_b.name }
    sorted_songs.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
   sorted_artists = Artist.all.map {|artist| artist.name}.uniq.sort
   sorted_artists.each_with_index do |artist, i|
     puts "#{i+1}. #{artist}"
   end
 end

 def list_genres
    sorted_genres = Genre.all.map {|genre| genre.name}.uniq.sort
    sorted_genres.each_with_index do |genre, i|
      puts "#{i+1}. #{genre}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    songs = Song.all.select {|song| song.artist.name == input}.sort {|song_a,song_b| song_a.name <=> song_b.name }
    songs.each_with_index do |song, i|
      puts "#{i+1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    songs = Song.all.select {|song| song.genre.name == input}.sort {|song_a,song_b| song_a.name <=> song_b.name }
    songs.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name}"
    end
  end
end
