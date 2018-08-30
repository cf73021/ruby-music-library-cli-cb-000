module Concerns::Findable
  def find_by_name(name)
    self.all.find{|obj| obj.name == name}
  end

  def create_by_name(name)
    create(name)
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def find_or_create_by_name(name)
    found = find_by_name(name)
    if found != nil
    then
      return found
    else
      create_by_name(name)
    end
end
