module Concerns::Findable
  def find_by_name(name)
    self.all.find{|obj| song.name == name}
end
