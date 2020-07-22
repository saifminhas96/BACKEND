class MovieController < ApplicationController

    def movies
        puts "Request received"

        movies_response = RestClient.get("www.omdbapi.com/?s=batman&apikey=#{ENV["API_SECRET_KEY"]}")
        movies_array = JSON.parse(movies_response.body)
        render json: movies
    end
end

