class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :review_body

      t.timestamps
    end
  end
end
