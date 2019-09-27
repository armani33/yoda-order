class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating,        default: 0
      t.string :name
      t.string :city
      t.string :country
      t.text :comment
      t.date :available_time

      t.timestamps
    end
  end
end
