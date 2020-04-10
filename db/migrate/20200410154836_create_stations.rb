class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :origin
      t.string :name
      t.string :address
      t.string :fuel_type
      t.string :access_times
      t.string :distance
      t.string :travel_time
      t.text :directions

      t.timestamps
    end
  end
end
