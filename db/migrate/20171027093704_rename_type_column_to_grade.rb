class RenameTypeColumnToGrade < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :type, :grade
  end
end
