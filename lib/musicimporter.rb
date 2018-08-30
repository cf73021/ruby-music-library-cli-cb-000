class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = Dir.entries(path).select {|file| file.match(/\.mp3/)}
  end

  def files
    @files
  end

end
