class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name
    self.artist.name
  end

  def note_contents
    self.notes.map do |c|
      c.content
    end
  end

  def note_contents=(content)
    if (content != nil || content.length != 0)
      note = Note.create(content: content)
      self.notes << note
    end
  end
end
