class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :title

      t.timestamps
    end
  end
end
