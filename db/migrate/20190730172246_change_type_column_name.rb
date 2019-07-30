class ChangeTypeColumnName < ActiveRecord::Migration[5.2]
  def change
      rename_column :skateboards, :type, :board_type
  end
end
