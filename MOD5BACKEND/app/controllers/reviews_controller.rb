class ReviewsController < ApplicationController
    def review
        review = Review.create(user_id: logged_in_user.id, review_body: params[:review_body], movie_id: params[:movie_id])
        render json: review
    end

    def get_reviews
        @reviews = Review.where(movie_id: params[:movie_id])
        render json: @reviews
    end
end
