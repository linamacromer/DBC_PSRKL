class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|

      t.timestamps
    end
  end
end
