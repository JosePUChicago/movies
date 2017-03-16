class AddAddressFormattedAddressToTheater < ActiveRecord::Migration[5.0]
  def change
    add_column :theaters, :address_formatted_address, :string
  end
end
