class ChangePrimaryKeyInEarthquake < ActiveRecord::Migration[7.1]
  def change
    remove_column :earthquakes, :id
    add_column :earthquakes, :id, :string, primary_key: true
  end
end
