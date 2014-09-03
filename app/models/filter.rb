class Filter < ActiveRecord::Base
  validates :keywords, presence: true
  validates :price_high, allow_blank: true, numericality: {greater_than_or_equal_to: 0.01}
  validates :price_low, allow_blank: true, numericality: {greater_than_or_equal_to: 0.01}
  validate  :price_high_gt_price_low

  default_scope order: 'updated_at DESC'

  belongs_to :user
  has_many :hit_lists, dependent: :destroy
  has_many :listings, through: :hit_lists do
    def <<(items)
      super( Array(items) - proxy_association.owner.listings )
    end
  end

  private

  def price_high_gt_price_low
    if price_high and price_low and price_high < price_low
      errors.add(:price_high, "should be greater than price low")
    end
  end

end
