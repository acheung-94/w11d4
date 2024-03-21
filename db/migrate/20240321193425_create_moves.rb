class CreateMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :moves do |t|
      t.string :name

      t.timestamps
    end
    add_index :moves, :name, unique: true
  end
end
