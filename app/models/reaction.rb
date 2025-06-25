class Reaction < ApplicationRecord
  belongs_to :confession

  validates :reaction_type, inclusion: { in: %w[like hug laugh] }
  validates :ip, presence: true
  validates :confession_id, uniqueness: { scope: :ip } # only one per IP per confession
end
