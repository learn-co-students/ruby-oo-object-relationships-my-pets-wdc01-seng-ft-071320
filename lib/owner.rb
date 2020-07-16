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
end