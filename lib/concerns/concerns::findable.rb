module Concerns::Findable
  def find_by_name
    self.all.find{|song| song.name == name}
end
