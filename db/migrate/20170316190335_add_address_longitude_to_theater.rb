class AddAddressLongitudeToTheater < ActiveRecord::Migration[5.0]
  def change
    add_column :theaters, :address_longitude, :float
  end
end
