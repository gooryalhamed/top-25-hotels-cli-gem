class Top25::Place
  attr_accessor :num, :name, :location, :url
  @@all =[]
  def initialize(attr_hash)   #{name: "", location: "", :address =>""}
    attr_hash.each do |attribute, v|
      self.send("#{attribute}=",v)
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
end
=begin
def add_attr(h)
  h.each do |k, v|
    self.send("#{h}=",v)
  end
  self
end
=end


## @@all will only contain one place at a time hotels, restaurants or beaches
