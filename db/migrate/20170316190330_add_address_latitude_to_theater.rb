class AddAddressLatitudeToTheater < ActiveRecord::Migration[5.0]
  def change
    add_column :theaters, :address_latitude, :float
  end
end
