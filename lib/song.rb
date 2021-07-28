class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    new_song = nil
    if !self.find_by_name(name)
      new_song = create_by_name(name)
    else
      new_song = self.find_by_name(name)
    end
    new_song
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    arrFileName = filename.split(" - ")
    new_song = self.new
    new_song.name = arrFileName[1].split(".")[0]
    new_song.artist_name =  arrFileName[0]
    new_song.save
    new_song
  end

  def self.create_from_filename(filename)
    arrFileName = filename.split(" - ")
    new_song = self.new
    new_song.name = arrFileName[1].split(".")[0]
    new_song.artist_name =  arrFileName[0]
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
