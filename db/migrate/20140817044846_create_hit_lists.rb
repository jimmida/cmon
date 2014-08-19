class CreateHitLists < ActiveRecord::Migration
  def change
    create_table :hit_lists do |t|
      t.references :listing, index: true
      t.belongs_to :filter, index: true

      t.timestamps
    end
  end
end
