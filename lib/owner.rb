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
  |cats|   cats.owner == self
end
end

def dogs
Dog.all.select do
  |dogs| dogs.owner == self
end
end


def buy_cat(foo)
Cat.new(foo, self)
end

def buy_dog(foo)
  Dog.new(foo, self)
 end
end
