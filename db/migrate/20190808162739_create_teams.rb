class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :matches_played
      t.integer :matches_won
      t.integer :matchs_lost
      t.integer :games_diff
      t.integer :point_diff
    end
  end
end
