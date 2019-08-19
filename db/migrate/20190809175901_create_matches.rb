class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :team1
      t.integer :team2
      t.integer :team1_wins
      t.integer :team2_wins
    end
  end
end
