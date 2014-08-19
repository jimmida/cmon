class Listing < ActiveRecord::Base
  validates :post_id, uniqueness: true
  validates :url, uniqueness: true
  validates :post_id, :post_time, :title, :url, presence: true
  validates :price, allow_blank: true, numericality: {greater_than_or_equal_to: 0.01}
  validates :contact_phone, allow_blank: true, format: {
    with: %r{\A(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?\z}i
  }
  validates :contact_email, allow_blank: true, format: {
    with: %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z}i,
  }

  has_many :hit_lists
  has_many :filters, through: :hit_lists

  scope :active, -> (active) { where active: active }
  scope :title, -> (keyword) { where("title like ?", "%#{keyword}%")}

  class << self
    def apply(filter)
      hits = Listing.active(true).title(filter.keywords)
      filter.listings << hits
    end

    def case_insensitive_title(keywords)
      keywords.split(', ').each do |keyword|
        s = keyword.singularize
        p = keyword.pluralize
      end
    end
  end
end
