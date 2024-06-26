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
  validates :move_id, uniqueness: {scope: :pokemon_id, message: "'%{value} cannot have the same move more than once.'"}
  
  belongs_to :move
  belongs_to :pokemon
end
