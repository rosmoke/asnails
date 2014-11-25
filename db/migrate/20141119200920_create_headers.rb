class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.string :image_uid
      t.string :title

      t.timestamps
    end
  end
end
