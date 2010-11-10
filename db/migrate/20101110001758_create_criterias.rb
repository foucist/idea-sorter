class CreateCriterias < ActiveRecord::Migration
  def self.up
    create_table :criterias do |t|
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :criterias
  end
end
