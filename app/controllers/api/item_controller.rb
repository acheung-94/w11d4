class Api::ItemController < ApplicationController
    def index()
        render json: Item.where(pokemon_id: params[:pokemon_id])
    end
    def create()
        @item = Item.new(item_params)
        @item.pokemon_id = params[:pokemon_id]
        if @item.save()
            render json: @item
        else 
            render json: @item.errors.full_messages, status_code: 422
        end
    end
    def update()
        @item = Item.find_by(id: params[:id])
        if @item&.update(item_params)
            render json: @item
        elsif @item == nil
            render json: ['item not found'], status_code: 404
        else 
            render json: @item.errors.full_messages, status_code: 422
        end
    end
    def destroy()
        @item = Item.find_by(id: params[:id])
        if @item.destroy
            render json: {id: params[:id]}
        else 
            render json: ['item not found'], status_code: 404
        end
    end
    private
    def item_params
        params.require(:item).permit(:name, :price, :happiness, :image_url)
    end
end
