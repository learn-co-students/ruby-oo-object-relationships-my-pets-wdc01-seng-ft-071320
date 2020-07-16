require 'pry'

class Cat

  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(name, owner_obj, mood="nervous")
    @name = name
    @owner = owner_obj
    @mood = mood
    @@all << self
  end

  def self.all
    @@all
  end

end 