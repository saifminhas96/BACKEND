class MovieController < ApplicationController

    def movies
        puts "Request received"

        movies_response = RestClient.get("www.omdbapi.com/?s=#{params[:search_term]}&apikey=#{ENV["API_SECRET_KEY"]}")
        movies_data = JSON.parse(movies_response.body)
        render json: movies_data
    end
end

