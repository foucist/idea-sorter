class CreateCriteria < ActiveRecord::Migration
  def self.up
    create_table :criteria do |t|
      t.string :title
      t.integer :rank
      t.timestamps
    end
  end

  def self.down
    drop_table :criteria
  end
end
