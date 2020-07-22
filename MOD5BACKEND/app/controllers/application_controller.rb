class ApplicationController < ActionController::API

    def external_movie_api_data 
        movies = RestClient.get("www.omdb.com/api?key=#{ENV["API_SECRET_KEY" ]}")
    end
end


