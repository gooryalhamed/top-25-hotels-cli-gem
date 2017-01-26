class Top25::Place
  attr_accessor :num, :name, :location
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

end
