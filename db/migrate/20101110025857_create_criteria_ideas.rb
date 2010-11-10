class CreateCriteriaIdeas < ActiveRecord::Migration
  def self.up
    create_table :criteria_ideas do |t|
      t.integer :criteria_id
      t.integer :idea_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :criteria_ideas
  end
end
