class Confession < ApplicationRecord
  has_many :reactions, dependent: :destroy

  validates :body, presence: true, length: { maximum: 500 }
  validates :ip, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
