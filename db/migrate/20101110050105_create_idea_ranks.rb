class CreateIdeaRanks < ActiveRecord::Migration
  def self.up
    create_table :idea_ranks, :id => false do |t|
      t.integer :criterion_id
      t.integer :idea_id
      t.integer :rank

      #t.timestamps
    end
    #Add a unique index that includes both columns. That will prevent you from inserting a record that contains a duplicate category_id/post_id pair.
    add_index :idea_ranks, [:criterion_id, :idea_id], :unique => true
  end

  def self.down
    drop_table :idea_ranks
    remove_index :idea_ranks, [:criterion_id, :idea_id], :unique => true
  end
end
