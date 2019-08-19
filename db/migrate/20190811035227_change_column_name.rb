class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :matchs_lost, :matches_lost
  end
end
