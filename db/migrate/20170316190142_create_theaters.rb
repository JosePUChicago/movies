class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :address
      t.string :name

      t.timestamps

    end
  end
end
