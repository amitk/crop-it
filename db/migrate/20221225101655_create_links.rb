class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :url 
      t.string :code
      t.boolean :expired, default: false
      t.time :active_duration
      t.timestamps
    end
  end
end
