class Addcolumntofacultydetail < ActiveRecord::Migration
  def change
  	add_column :queryemails, :toemail, :string
  end
end
