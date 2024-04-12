class CreateEarthquakes < ActiveRecord::Migration[7.1]
  def change
    create_table :earthquakes do |t|
      t.float :mag
      t.string :place
      t.integer :time
      t.string :url
      t.integer :tsunami
      t.string :magType
      t.string :title
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
