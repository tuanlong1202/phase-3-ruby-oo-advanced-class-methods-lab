require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "" )
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # NOTHINGIN HERE SO ITS NILL
    song = self.new
    binding.pry
    @@all << song# this returns an array, returns the new array
    return song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    @@all << song
    return song #explicit
  end

end
