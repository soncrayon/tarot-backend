class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
     
      t.timestamps
      t.string :date_time_created
      
    end
  end
end
