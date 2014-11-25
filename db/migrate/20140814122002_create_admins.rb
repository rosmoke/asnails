class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :title
      t.text :p1
      t.text :p2
      t.text :p3
      t.string :image_url

      t.timestamps
    end
  end
end
