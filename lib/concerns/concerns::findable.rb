module Concerns::Findable
  def find_by_name(name)
    self.all.find{|song| song.name == name}
end
