class AdsController < ApplicationController

    def index
          @ads = Ad.all
    end


    def show
          @ad = Ad.find_by_id(params[:id] )
    end


    def new
           @ad = Ad.new
    end

    def create
        @ad= Ad.new(ad_params)

        respond_to do |format|
            if @ad.save
                format.html { redirect_to @ad, notice: 'Contact was successfully created.' }
                format.json { render action: 'show', status: :created, location: @ad }
            else
                format.html { render action: 'new' }
                format.json { render json: @ad.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def ad_params
        params.require(:ad).permit(:name, :description, :price, :seller_id)
    end
end
