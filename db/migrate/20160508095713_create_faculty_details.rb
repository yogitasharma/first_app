class CreateFacultyDetails < ActiveRecord::Migration
  def change
    create_table :faculty_details do |t|
      t.string :name
      t.string :email
      t.string :department
      t.string :post
      t.text :description
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
