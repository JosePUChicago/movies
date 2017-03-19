class MovieWatchlist < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => :interests_count

  belongs_to :movie,
             :counter_cache => :interests_count

  # Indirect associations

  # Validations
validates :user, :presence=> true
validates :movie, :presence=> true, :uniqueness=> {:scope=> :user}
end
