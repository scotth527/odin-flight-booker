class FlightsController < ApplicationController
    def index
        @flights = Flight.all

        @available_airports = Airport.all.uniq{ |x| x.airport_code }
        .map { |airport| [ airport.airport_code , airport.id]}

        @passengers = [[1,1],[2,2],[3,3],[4,4]]

        @available_dates = @flights.all.uniq{ |f| f.start_datetime }

        @available_days = @available_dates.map { |flight| [ flight.start_datetime.strftime("%d"), flight.start_datetime.strftime("%d")  ] }
        @available_months = @available_dates.map { |flight| [ flight.start_datetime.strftime("%m"), flight.start_datetime.strftime("%m")  ] }
        @available_years = @available_dates.map { |flight| [ flight.start_datetime.strftime("%Y"), flight.start_datetime.strftime("%Y")  ] }

        if params[:search]
            if params[:from_airport].blank?
                flash.now[:alert] = "Departure airport is missing."
            elsif params[:to_airport].blank?
                flash.now[:alert] = "Arrival airport is missing."
            elseif params[:day].blank? || params[:month].blank? || params[:year].blank?
                flash.now[:alert] = "Date is missing or incorrect."
            end

            @search_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)

            @search_results = Flight.where(
                    from_airport_id:  params[:from_airport],
                    to_airport: params[:to_airport],
                    :start_datetime => @search_date.beginning_of_day..@search_date.end_of_day
            )
        end
    end

    private

    def flight_date_formatted(flight_day)
        flight_day.strftime("%m/%d/%Y")
    end
end
