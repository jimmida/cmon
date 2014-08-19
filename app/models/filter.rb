class Filter < ActiveRecord::Base
  has_many :hit_lists, dependent: :destroy
  has_many :listings, through: :hit_lists do
    def <<(items)
      super( Array(items) - proxy_association.owner.listings )
    end
  end
end
