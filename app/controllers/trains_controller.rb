class TrainsController < ApplicationController

    before_action :set_train, only: [:show, :edit, :update, :destroy]
    def index
        @trains = Train.all
    end

    def show
    end

    def new
        @train = Train.new

    end

    def create
        @train = Train.new(train_params)
    
        respond_to do |format|
          if @train.save
            format.html { redirect_to train_url(@train)}
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    def edit
    end

    def update
        if @train.update(train_params)
            redirect_to @train
        else
            render :edit
        end
    end

    def destroy
        @train.destroy
        redirect_to trains_path
    end

    private
    
    def set_train
        @train = Train.find(params[:id])
    end
    def train_params
        params.require(:train).permit(:number, :current_station_id)
    end
end