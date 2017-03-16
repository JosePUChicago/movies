class AddShowtimeCountToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :showtimes_count, :integer
  end
end
