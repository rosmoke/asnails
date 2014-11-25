class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.string :comments
      t.string :select_option
      t.date :date
      t.timestamp :time

      t.timestamps
    end
  end
end
