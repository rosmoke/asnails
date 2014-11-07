class AddImageToGallery < ActiveRecord::Migration
  def change
    add_column :pages, :image, :string
  end
end
