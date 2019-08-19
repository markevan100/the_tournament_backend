class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :team1
      t.integer :team2
      t.integer :team1_points
      t.integer :team2_points
    end
  end
end
