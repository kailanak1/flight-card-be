class AddTimeToFlightDeparts < ActiveRecord::Migration[6.0]
  def change
    add_column :flight_departs, :time, :datetime
  end
end
