class CreateDamages < ActiveRecord::Migration[6.1]
  def change
    create_table :damages do |t|
      t.json :data
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
