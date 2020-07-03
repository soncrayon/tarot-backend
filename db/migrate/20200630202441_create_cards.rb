class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :image
      t.text :description
      t.belongs_to :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
