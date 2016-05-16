class CreateFacultydetails < ActiveRecord::Migration
  def change
    create_table :facultydetails do |t|
      t.string :name
      t.string :post
      t.text :description
      t.string :email
      t.string :department
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
