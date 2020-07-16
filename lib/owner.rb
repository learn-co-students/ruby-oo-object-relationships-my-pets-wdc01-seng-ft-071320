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
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

def walk_dogs
  self.dogs.mood = "happy"
end

  









end


