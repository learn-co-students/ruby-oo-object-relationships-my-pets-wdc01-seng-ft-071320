require_relative "./cat.rb"
require_relative "./dog.rb"
require 'pry'
class Owner
  
  attr_reader :name, :species
  attr_writer :cat
  attr_accessor :new_cat, :new_dog, :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all = []
  end

  def cats
    #Loop through all cats to see if they belong to owner
    Cat.all.select do |cat|  
      cat.owner == self
    end
  end

  def dogs
    #Loop through all dogs to see if they belong to owner
    Dog.all.select do |dog|  
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    #Create new instance of cat
    #Add new cat into array of cat names
    @new_cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    @new_dog = Dog.new(dog_name, self)
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
    #Remove cats and dogs from owner's possession
    #Change mood to nervous
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats = []
    self.dogs =[]
  end

  def list_pets
    
    
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end