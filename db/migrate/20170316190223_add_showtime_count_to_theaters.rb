class AddShowtimeCountToTheaters < ActiveRecord::Migration[5.0]
  def change
    add_column :theaters, :showtimes_count, :integer
  end
end
