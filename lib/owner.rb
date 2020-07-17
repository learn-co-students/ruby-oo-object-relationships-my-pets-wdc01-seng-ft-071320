require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species
  @@all =[]
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
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.find_all do |a_cat|
      a_cat.owner == self
    end
  end

  def dogs
    Dog.all.find_all do |a_dog|
      a_dog.owner == self
    end
  end

  def buy_cat(buy_cat)
    Cat.new(buy_cat, self)
  end

  def buy_dog(buy_dog)
    Dog.new(buy_dog, self)
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
    # self.cats.map do |cat|
    #   cat.mood = "nervous"
    #   cat.owner = nil
    # end

    # self.dogs.map do |dog|
    #   dog.mood = "nervous"
    #   dog.owner = nil
    # end
    pets = self.dogs + self.cats
    pets.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end 

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end