class ApplicationController < ActionController::API

    def external_movie_api_data 
        movies = RestClient.get("www.omdb.com/api?key=#{ENV["API_SECRET_KEY" ]}")
    end
    def secret
        ENV["secret"]
      end
    
      def encode_token(payload)
        JWT.encode(payload, secret)
      end 
    
      def auth_header
        request.headers['Authorization']
      end
    
      def decode_token
        if auth_header
          token = auth_header.split(' ')[1]
          begin
            JWT.decode(token, secret, true, algorithm: 'HS256').first
          rescue JWT::DecodeError
            nil
          end
        end
      end

      def logged_in_user
        User.find(decode_token["id"])       
      end
    
end






