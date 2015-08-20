class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :title
    	t.string :genre
    	t.date :release_date
    	t.string :thumbnail
    	t.string :url
      t.string :score

      t.timestamps null: false
    end
  end
end
