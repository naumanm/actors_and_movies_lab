class Movie < ActiveRecord::Base
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def info
    # this conctatnates both and lets us call Movie.info for the value
    #{self.title} #{self.year}
  end
end
