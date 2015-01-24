class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.string :img_url
      t.integer :votes
      t.string   :image_uid
      t.timestamps
    end
  end
end
