class CreateMymarks < ActiveRecord::Migration
  def self.up
    create_table :mymarks do |t|
      t.integer :user_id
      t.integer :mark_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mymarks
  end
end
