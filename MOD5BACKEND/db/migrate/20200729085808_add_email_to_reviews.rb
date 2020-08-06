class AddEmailToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :email, :string
    add_column :reviews, :movie_id, :string
  end
end
