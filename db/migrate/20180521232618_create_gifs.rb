class CreateGifs < ActiveRecord::Migration[5.2]
  def change
    create_table :gifs do |t|
      t.string :image_path
      t.integer :category_id

      t.timestamps
    end
  end
end
