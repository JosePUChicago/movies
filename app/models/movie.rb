class Movie < ApplicationRecord
  # Direct associations

  has_many   :interests,
             :class_name => "MovieWatchlist",
             :dependent => :destroy

  has_many   :showtimes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
