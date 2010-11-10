class CreateIdeaCriterias < ActiveRecord::Migration
  def self.up
    create_table :idea_criterias, :id => false do |t|
      t.integer :criteria_id
      t.integer :idea_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :idea_criterias
  end
end
