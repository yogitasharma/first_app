class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :subject
      t.string :department
      t.text :description
      t.string :semester

      t.timestamps null: false
    end
  end
end
