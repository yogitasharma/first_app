class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t| 
      t.has_attached_file :image
      t.has_attached_file :document
      t.has_attached_file :audio

      t.timestamps null: false
    end
  end
end
