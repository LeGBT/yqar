class CreateRepSources < ActiveRecord::Migration
  def self.up
    create_table :rep_sources do |t|
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :rep_sources
  end
end
