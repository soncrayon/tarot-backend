class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :period
      t.string :card_name
      t.text :card_full_meaning
      t.string :card_upright
      t.string :card_reversed
      t.string :card_image
      t.string :card_orientation
      t.belongs_to :reading, null: true, foreign_key: true
    end
  end
end
