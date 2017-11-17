class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    	t.string  		:title
    	t.string		:description
    	t.string		:price
    	t.string 		:status, default: "open"
        t.string        :zip_code
    	t.string 		:city
    	t.boolean		:negotiable
    	t.references	:loaner
    	t.references	:category

    	t.timestamps
    end
  end
end
