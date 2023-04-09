class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.integer :population
      t.string :currencies, array: true, default: []
      t.string :languages, array: true, default: []
      t.jsonb :data, default: {}
      t.timestamps

      t.index :languages, using: :gin
      t.index :currencies, using: :gin
      t.index :data, using: :gin
    end
  end
end
