class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.date :datetime
      t.string :time
      t.integer :movie_id
      t.integer :theater_id
      t.string :quals
      t.string :ticketurl

      t.timestamps

    end
  end
end
