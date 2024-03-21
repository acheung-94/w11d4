class Api::PokemonController < ApplicationController
    def index() 
        render json: Pokemon.all()
    end
    def create() 
        @poke = Pokemon.new(poke_params)
        if @poke.save 
            render @poke
        else
            render @poke.errors.full_messages, status_code: 422
        end
    end
    def show() 
        if params[:id] == 'types'
            render json: Pokemon::TYPES
        else 
            render json: Pokemon.find_by(id: params[:id])
        end
    end
    def update()
        @poke = Pokemon.find_by_id(params.id)
        if @poke&.update(poke_params)
            render json: @poke
        else
            if @poke == nil 
                render json: ["no pokemon with id #{params[:id]} was found"], status_code: 404
            else 
                render json: @poke.errors.full_messages, status_code: 422
            end
        end
    end 
    def types()
        render json: Pokemon.TYPES
    end
    private
    def poke_params() 
        params.require(:pokemon).permit(:number, :name, :attack, :defense, :caputred, :poke_type, :image_url)
    end
end
