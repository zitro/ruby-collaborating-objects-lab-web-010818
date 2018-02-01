require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []

    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)  #passing in song instance
    self.songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    found_artist = self.all.find{ |artist| artist.name == name}
    if found_artist
      found_artist
    else
      self.new(name)
    end
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

end
