class ModifyMatches < ActiveRecord::Migration
  def change
    add_column :matches, :round_id, :integer, foreign_key: true
  end
end
