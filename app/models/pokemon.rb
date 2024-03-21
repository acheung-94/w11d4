class Pokemon < ApplicationRecord
    validates :number, :name, :attack, :defense,
        :poke_type, :image_url, :captured, presence: true
end
