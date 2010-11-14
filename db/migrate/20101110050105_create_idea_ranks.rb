class CreateIdeaRanks < ActiveRecord::Migration
  def self.up
    create_table :idea_ranks, :id => false do |t|
      t.integer :criterion_id
      t.integer :idea_id
      t.integer :rank

      #t.timestamps
    end
  end

  def self.down
    drop_table :idea_ranks
  end
end
