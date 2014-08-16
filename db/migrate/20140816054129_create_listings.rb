class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :post_id
      t.datetime :post_time
      t.datetime :update_time

      t.string :contact_name
      t.string :contact_method
      t.string :contact_phone
      t.string :contact_email

      t.string :title
      t.text :body
      t.decimal :price, precision: 8, scale: 2

      t.string :region
      t.string :address
      t.decimal :longitude
      t.decimal :latitude

      t.string :category
      t.string :subcategory
      t.string :area

      t.boolean :active

      t.timestamps
    end
  end
end
