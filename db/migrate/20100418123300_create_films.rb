class CreateFilms < ActiveRecord::Migration
  def self.up
    create_table :films do |t|
      t.string :imdb_id
      t.string :path
      t.string :hash

      t.timestamps
    end
  end

  def self.down
    drop_table :films
  end
end
