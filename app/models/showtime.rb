class Showtime < ApplicationRecord
  # Direct associations

  belongs_to :theater,
             :counter_cache => true

  belongs_to :movie,
             :counter_cache => true

  # Indirect associations

  # Validations

end
