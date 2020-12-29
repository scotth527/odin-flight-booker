class FlightsController < ApplicationController
    def index
        @flights = Flight.all

        @available_airports = Airport.all.uniq{ |x| x.airport_code }
        .map { |airport|
            [ airport.airport_code , airport.id]
        }
        # @from_airports = Flight.all.uniq{ |x|
        #     x.from_airport.airport_code
        # }
        # .map { |flight|
        #     [ flight.from_airport.airport_code , flight.from_airport_id]
        # }
        # @to_airports = Flight.all.uniq{ |x|
        #     x.to_airport.airport_code
        # }
        # .map { |flight|
        #     [ flight.to_airport.airport_code , flight.to_airport_id]
        # }

        @search_results = []

        if params
            p "These are my params"
            p params
            @search_results = Flight.where(from_airport_id: params[:from_airport], to_airport_id: params[:to_aiport])
            p "Search Results"
            p @search_results
        else
            p "No params available"
            @search_results
        end
    end

    private
    def flight_params
        params.require(:flight).permit(:start_datetime, :from_airport, :to_airport)
    end
end
