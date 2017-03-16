class Movie < ApplicationRecord
  # Direct associations

  has_many   :interests,
             :class_name => "MovieWatchlist",
             :dependent => :destroy

  has_many   :showtimes,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :interests,
             :source => :user

  # Validations

end
