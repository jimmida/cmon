class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :keywords
      t.decimal :price_high
      t.decimal :price_low
      t.string :location
      t.string :subcategory
      t.string :category
      t.string :area

      t.timestamps
    end
  end
end
