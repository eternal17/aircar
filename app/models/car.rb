class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_make_and_model,
    against: [ :make, :model, :address ],
    using: {
      tsearch: { prefix: true } 
    }
end
