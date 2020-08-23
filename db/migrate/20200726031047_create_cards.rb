class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :period
      t.string :name
      t.text :full_meaning
      t.string :upright_meaning
      t.string :reversed_meaning
      t.string :image
      t.string :orientation
      t.belongs_to :reading, null: true, foreign_key: true
      t.belongs_to :user, null: true, foreign_key: true
    end
  end
end
