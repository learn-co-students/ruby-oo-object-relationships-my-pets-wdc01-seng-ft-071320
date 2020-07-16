require_relative "./dog.rb"
require_relative "./cat.rb"
require 'pry'

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{species}."
  end

  def self.all
    return @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
  #look into all cats find cats that belong to owner
    Cat.all.select do
      |cats| cats.owner == self
    end
  end

  def dogs #know all about their dogs
    Dog.all.select do
      |dogs| dogs.owner == self
    end
end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

#class solution

# class Owner
#   attr_reader :name, :species
#   @@all_owner = []
#   def initialize(name)
#     @name = name
#     @species = "human"
#     @@all_owner << self 
#   end
  
#   def say_species
#     "I am a #{self.species}."
#   end

#   def self.all
#     @@all_owner
#   end

#   def self.count
#     @@all_owner.length #count works too
#   end

#   def self.reset_all
#     @@all_owner.clear
#   end

#   def cats 
#     Cat.all.find_all do |cat|
#       cat.owner  == self 
#     end
#   end

#   def dogs 
#     Dog.all.find_all do |dog|
#       dog.owner  == self 
#     end
#   end  

#   def buy_cat(name)
#     Cat.new(name, self)
#   end

#   def buy_dog(name)
#     Dog.new(name, self)
#   end

#   def walk_dogs
#     self.dogs.map do |dog|
#       dog.mood = "happy"
#     end
#   end

#   def feed_cats
#     self.cats.map do |cat|
#       cat.mood = "happy"
#     end
#   end

#   def sell_pets
#     pets = self.dogs + self.cats
#     pets.map do |pet|
#       pet.mood = "nervous"
#       pet.owner = nil
#     end
#   end

#   def list_pets
#     "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
#   end

# end
