module Api
  class EarthquakesController < ApplicationController
    before_action :set_earthquake, only: %i[show update destroy]

    # GET /earthquakes
    def index
      @earthquakes = Earthquake.all

      render json: {
        data: @earthquakes.map do |earthquake|
          {
            id: earthquake.id,
            type: 'feature',
            attributes:
            {
              external_id: earthquake.id,
              magnitude: earthquake.mag,
              place: earthquake.place,
              time: earthquake.time,
              tsunami: earthquake.tsunami,
              mag_type: earthquake.magType,
              title: earthquake.title,
              coordinates:
              {
                longitude: earthquake.longitude,
                latitude: earthquake.latitude
              },
              links:
              {
                external_url: earthquake.url
              }
            }
          }
        end,
        pagination:
        {
          current_page: params[:page],
          total: 0,
          per_page: params[:per_page]
        }
      }
    end

    # GET /earthquakes/1
    def show
      render json: @earthquake
    end

    # POST /earthquakes
    def create
      @earthquake = Earthquake.new(earthquake_params)

      if @earthquake.save
        render json: @earthquake, status: :created, location: @earthquake
      else
        render json: @earthquake.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /earthquakes/1
    def update
      if @earthquake.update(earthquake_params)
        render json: @earthquake
      else
        render json: @earthquake.errors, status: :unprocessable_entity
      end
    end

    # DELETE /earthquakes/1
    def destroy
      @earthquake.destroy!
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_earthquake
      @earthquake = Earthquake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def earthquake_params
      params.require(:earthquake).permit(:mag, :place, :time, :url, :tsunami, :magType, :title, :longitude, :latitude)
    end
  end
end
