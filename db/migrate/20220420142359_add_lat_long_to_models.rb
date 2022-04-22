class AddLatLongToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :breweries, :latitude, :decimal, precision: 9, scale:6
    add_column :breweries, :longitude, :decimal, precision: 9, scale:6
    add_column :locations, :latitude, :decimal, precision: 9, scale:6
    add_column :locations, :longitude, :decimal, precision: 9, scale:6
  end
end
