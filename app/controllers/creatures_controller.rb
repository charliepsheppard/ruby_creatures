class CreaturesController < ApplicationController

    def index 
        @creatures = Creature.all
    end

    def show
        @creature = Creature.find(params[:id])
    end

    def new
        @creature = Creature.new
    end

    def create
        creature_params = params.require(:creature).permit(:name, :description)
        creature = Creature.new(creature_params)

        if creature.save
            redirect_to creature_path(creature)
        end
    end

    def edit 
        @creature = Creature.find(params[:id])
    end

    def update 
        creature = Creature.find(params[:id])
        creature.update_attributes(creature_params)
        redirect_to creature 
    end

    def destroy
        @creature = Creature.destroy(params[:id])
        redirect_to creatures_path
    end

    private
    
    def creature_params
        params.require(:creature).permit(:name, :description)
    end
end
