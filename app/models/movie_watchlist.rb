class MovieWatchlist < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => :interests_count

  belongs_to :movie,
             :counter_cache => :interests_count

  # Indirect associations

  # Validations

end
