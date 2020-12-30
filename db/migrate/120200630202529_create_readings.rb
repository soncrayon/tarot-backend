class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
     
      t.timestamps
      t.string :date_time_created
      t.belongs_to :user, null: true, foreign_key: true
      
    end
  end
end
