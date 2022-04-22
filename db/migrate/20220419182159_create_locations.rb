class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode

      t.timestamps
    end
  end
end
