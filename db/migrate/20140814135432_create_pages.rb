class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

      t.string :title
      t.string :newsletter
      t.text :p1
      t.text :p2

      t.timestamps
    end
  end
end
