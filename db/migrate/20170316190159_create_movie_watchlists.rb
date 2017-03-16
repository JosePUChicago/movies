class CreateMovieWatchlists < ActiveRecord::Migration
  def change
    create_table :movie_watchlists do |t|
      t.integer :user_id
      t.integer :movie_id

      t.timestamps

    end
  end
end
