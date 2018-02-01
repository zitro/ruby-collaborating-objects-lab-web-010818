class Song

attr_accessor :name, :artist
@@all = []

def initialize(name)
	@name = name
	@artist = artist
	@@all << self
end

def self.all
		@@all
end

def save
	@@all << self
end

def self.new_by_filename(filename)
	file_arr = filename.split(' - ')  #[artist, song, genre]
	song_name = file_arr[1]
	artist_name = file_arr[0]
	#create new song inst and new artist inst
	new_song_inst = self.new(song_name)
	new_artist_inst = Artist.find_or_create_by_name(artist_name)
	#link up new instances to both sides
	new_song_inst.artist = new_artist_inst
	new_artist_inst.add_song(new_song_inst)
	#return new song inst
	new_song_inst
end

end
