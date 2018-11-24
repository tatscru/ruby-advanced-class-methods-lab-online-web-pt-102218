class Song
  attr_accessor :name, :artist_name
  # these are instances of a Song
  @@all = []
#   class variable -> self.class.all << self
# end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    # initializing a song >> song.new 
    @@all << song  
    # adding the song to the Song variable array
    song
    # returning the initialized song instance  
  end 
  
  def self.new_by_name(song_name) 
    song = self.new
    # literally this is how you build a new instance - song equals the name passed through
    song.name = song_name 
    # whatever name was passed through can now output the name variable 
    song
  end 
  
  def self.create_by_name(song_name)
    song = self.create 
    # building a song instance 
    song.name = song_name 
    # setting that name (string- song_name) as its name property 
    song
  end 
  
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
    # you are searchin for the match of the argument passed through. Self (arg.) searching all names that match. song parameter should find song.name equaling string passed through 
  end 
  
  def self.find_or_create_by_name(song_name) 
      self.find_by_name(song_name) || self.create_by_name(song_name)
    # here we are invoking both methods as asked. it will find it by name OR it will create a new song name
  end 
  
  def self.alphabetical 
    @@all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    # an array of songs is the filename split by a - 
    song_array[1] = song_array[1].chomp(".mp3")
    # chomp returns a new string with the given separator .mp3.  They first item in the array will now have .mp3 added to it. 
    song = self.new
    # creating a new song parsed with mp3 following it
    song.name = song_array[1]
    # song name is the first item in the array without the mp3
    song.artist_name = song_array[0]
    # zero is blank space
    song
  end 
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    # pulling the file name from above as an mp3 so we do not have to repeat code
    song.save
    song
  end 
  
  def self.destroy_all 
    @@all.clear
    # resetting the array to empty 
  end 
end
