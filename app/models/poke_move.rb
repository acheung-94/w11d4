# == Schema Information
#
# Table name: poke_moves
#
#  id         :bigint           not null, primary key
#  move_id    :bigint           not null
#  pokemon_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PokeMove < ApplicationRecord
  belongs_to :move
  belongs_to :pokemon
end
