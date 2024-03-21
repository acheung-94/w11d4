class CreatePokeMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :poke_moves do |t|
      t.references :move, null: false, foreign_key: true, index: false
      t.references :pokemon, null: false, foreign_key: true
      t.index [:pokemon_id, :move_id], unique: true

      t.timestamps
    end
  end
end
