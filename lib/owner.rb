require "pry"
class Owner
  attr_reader :name, :species

  @@all_owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all_owners << self
  
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all_owners
  end

  def self.count
    @@all_owners.length
  end

  def self.reset_all
    @@all_owners = []
  end

  def cats 
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
      #binding.pry
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

def walk_dogs
  self.dogs.map do |each_dog| 
    each_dog.mood = "happy"
  end
end

def feed_cats
  self.cats.map do |each_cat|
    each_cat.mood = "happy"
  end
end

def sell_pets
  self.cats.map do |each_cat|
    each_cat.mood = "nervous"
    each_cat.owner = nil
  end
  
  self.dogs.map do |each_dog| 
    each_dog.mood = "nervous"
    each_dog.owner = nil
  end
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end

end
