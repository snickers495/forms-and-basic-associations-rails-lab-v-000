class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(id)
     self.genre = Genre.find(id: id)
   end
end

