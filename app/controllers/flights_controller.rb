class FlightsController < ApplicationController
    def index
        @flights = Flight.all

        @available_airports = Airport.all.uniq{ |x| x.airport_code }
        .map { |airport| [ airport.airport_code , airport.id]}

        @passengers = [[1,1],[2,2],[3,3],[4,4]]

        if params[:search]
            p "These are my params"
            p params
            @search_results = Flight.where(
                    from_airport_id:  params[:from_airport],
                    to_airport: params[:to_airport]
            )

            p "Search Results"
            p @search_results
            p "Length of results"
            p @search_results.length()
        end
    end

    private
    def flight_params
        params.require(:flight).permit(:start_datetime, :from_airport, :to_airport)
    end
end
