class AddLocationIdToMymarks < ActiveRecord::Migration
  def self.up
	add_column "mymarks", "location_id", :integer
  end

  def self.down
  end
end
