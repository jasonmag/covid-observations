class CovidObservationsController < ApplicationController
    before_action :set_confirmed

    def confirmed
        render json: [
            :observation_date => params[:observation_date],
            :countries => @top_confirmed.as_json
        ]
    end

    private

    def set_confirmed
        @top_confirmed = CovidObservation.select("CountryRegion as Country,Confirmed,Deaths,Recovered").where(ObservationDate: params[:observation_date]).order(Confirmed: :desc).first(params[:max_results].to_i)
    end
end
