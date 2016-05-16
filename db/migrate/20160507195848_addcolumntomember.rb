class Addcolumntomember < ActiveRecord::Migration
  def change
  	add_column :members, :person, :string
  end
end
