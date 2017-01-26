class Top25::Place
  attr_accessor :num, :name, :location, :phone, :website, :address, :description, :url
  @@all =[]
  def initialize(attr_hash)   #{name: "", location: "", description:""}
    attr_hash.each do |attr, v|
      self.send("#{attr}=",v)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_from_collection(arr)
    arr.each do |hash|
      self.new(hash)
    end
  end

def add_attr(h)
  h.each do |k, v|
    self.send("#{h}=",v)
  end
  self
end

end
