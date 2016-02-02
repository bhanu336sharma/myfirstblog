class AddCheckToStudents < ActiveRecord::Migration
  def change
    add_column :students, :check, :Boolean
  end
end
