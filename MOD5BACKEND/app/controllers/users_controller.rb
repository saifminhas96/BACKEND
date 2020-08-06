class UsersController < ApplicationController

    def create
        # user = User.create(
        #     email: params[:email],
        #     firstname: params[:firstname],
        #     lastname: params[:lastname],
        #     password: params[:password]
        # )
        user = User.create(user_params)

        if user.valid?
          token = encode_token(user_id: user.id, email: user.email)
        
          render json: { user: user, jwt: token }, status: :created
        else
          puts user.errors.full_messages
          render json: { error: "failed to create user" }, status: :not_acceptable
        end
    end
      
    def sign_in
        user = User.find_by(email: params[:email])
       
        if user && user.authenticate(params[:password])
          render json: { user: user, token: encode_token({ id: user.id }) }
        else
          render json: { message: 'Invalid email or password' }
        end 
    end 
    
    def validate
        id = decode_token
        user = User.find_by(id: id)

        if user 
            render json: { user: user, token: encode_token({ id: user.id }) }
        else 
            render json: { message: 'Failure' }
        end 

    end 
    
      
    
    
    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password)
    end 
    
   
end
