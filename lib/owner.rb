#require 'cat.rb'
require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species

@@all_owners = []

  def initialize(name, species= "human")
    @name = name
    @species = species
    @@all_owners << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all_owners
  end

  def self.count
    @@all_owners.length
  end
  
  def self.reset_all
    @@all_owners.clear
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
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end