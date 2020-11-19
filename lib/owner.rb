require 'pry'
class Owner

  attr_reader :name, :species
  # attr_accessor 
  @@all = []
  def initialize(name)
    @name = name
    @species = 'human'
    self.class.all << self
  end 

  def self.all
    @@all 
  end 

  def say_species
    "I am a #{@species}."
  end 

  def self.count 
    self.all.length
  end 

  def self.reset_all
    self.all.clear
  end 

  def cats 
   
    all_cat = Cat.all.select do |cats|
        cats.owner == self  
    end 
   all = all_cat.collect do |kitty|
      kitty
    
    end 
    all 
  end 

  def dogs 
    all_dog = Dog.all.select do |dog|
      dog.owner == self 
    end 
    all = all_dog.collect do |doggy|
      doggy 
    end 
    all 
  end 
  
  def buy_cat(name)
    @@all << Cat.new(name,self)
  end 

  def buy_dog(name)
    @@all << Dog.new(name,self)
  end 

  def walk_dogs
    Dog.all.select do |mood|
      mood.mood = 'happy'
    end 
  end 

  def feed_cats
    Cat.all.select do |mood|
      mood.mood = 'happy'
    end 
  end 
  

  def sell_pets 
    Cat.all.select do |moods|
      moods.mood = 'nervous'
      moods.owner = nil
    end 
    Dog.all.select do |moods|
      moods.mood = 'nervous'
      moods.owner = nil
    end 
    Cat.all.clear 
    Dog.all.clear 
  end 

  def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end