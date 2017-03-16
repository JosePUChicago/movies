class AddInterestCountToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :interests_count, :integer
  end
end
