class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :happiness, null: false
      t.string :image_url, null: false
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
