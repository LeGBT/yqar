class AddRepSourceIdToFilms < ActiveRecord::Migration
  def self.up
    add_column :films, :rep_source_id, :integer	  
  end

  def self.down
	  remove_column :films, :rep_source_id
  end
end
