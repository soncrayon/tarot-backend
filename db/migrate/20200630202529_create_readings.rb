class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
