class HitList < ActiveRecord::Base
  belongs_to :listing
  belongs_to :filter
  validates_uniqueness_of :listing_id, :scope => [:filter_id]
end
