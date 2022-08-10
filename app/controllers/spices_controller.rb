class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices    
    end

    def create
        spice = Spice.create(title: params[:title], 
            image: params[:image], 
            description: params[:description],
             notes: params[:notes], rating: params[:rating])

            render json: spice, status: :created   
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice        
        else
            render json: {error: "Spice not found"}, status: :not_found        
        end    
    end

    def delete
        spice = Spice.find_by(id: params[:id])
        
        if spice
            spice.destroy            
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
            
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    
    end
end
