class AddIndexKeyToPhone < ActiveRecord::Migration
  def self.up
    add_index :bookings, :phone
  end

  def self.down
    remove_index :bookings, :phone
  end
end
