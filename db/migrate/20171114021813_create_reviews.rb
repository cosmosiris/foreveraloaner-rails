class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :body
      t.references :reviewer, class_name: "User"
      t.references :reviewee, class_name: "User"
      t.string :role

      t.timestamps
    end
  end
end
