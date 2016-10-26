class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :competitor1_id, foreign_key: true
      t.integer :competitor2_id, foreign_key: true
      t.datetime :start_time
      t.string :location
      t.integer :season
      t.integer :winner_id, foreign_key: true
      t.integer :loser_id, foreign_key: true
      t.timestamps
    end
  end
end
