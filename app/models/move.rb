# == Schema Information
#
# Table name: moves
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Move < ApplicationRecord
    validates :name, uniqueness: true, presence: true

    has_many :poke_moves,
        dependent: :destroy;

    has_many :pokemons,
        through: :poke_moves,
        source: :pokemon
end
