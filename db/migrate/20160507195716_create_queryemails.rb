class CreateQueryemails < ActiveRecord::Migration
  def change
    create_table :queryemails do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
