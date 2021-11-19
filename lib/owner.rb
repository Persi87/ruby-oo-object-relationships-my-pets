class Owner

  attr_reader :name, :species

  @@all_owners = []
   

  def initialize(name)
    @name = name
    @species = "human"
    @@all_owners << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all_owners
  end

  def self.count
    @@all_owners.count
  end

  def self.reset_all
    @@all_owners.clear
  end

  def cats
    Cat.all.select {|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dogs| dogs.mood = "happy"} # use the dogs method which already provides array of "self's" dogs, iterate through the array and change mood
  end

  def feed_cats
    cats.each {|cats| cats.mood = "happy"} # same as above
  end

  def sell_pets

    dogs.each do |dogs| 
      dogs.mood = "nervous"
      dogs.owner = nil
    end

    cats.each do |cats|
     cats.mood = "nervous"
     cats.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end