require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    #binding.pry
    new_song.save
    new_song
  end

  def self.find_by_name(name)
  #  binding.pry
    @@all.each do |song|
      #binding.pry
      if song.name == name
        return song
      end
    end
  #  binding.pry
    return nil
  end

  def self.find_or_create_by_name(name)
    found = find_by_name(name)
    #binding.pry
    if found == nil
      return create_by_name(name)
      #binding.pry
    end
    return find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.format_filename(filename)
    filename.gsub!(".mp3", "")
    attributes = filename.split(" - ")
    return attributes
  end

  def self.new_from_filename(filename)
    attributes = format_filename(filename)
    new_song = Song.new
    new_song.artist_name = attributes[0]
    new_song.name = attributes[1]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end
end
