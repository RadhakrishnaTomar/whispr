class Confession < ApplicationRecord
  has_many :reactions, dependent: :destroy

  validates :body, presence: true, length: { maximum: 500 }
  validates :ip, presence: true

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_associations(auth_object = nil)
    [ "reactions" ]
  end

   def self.ransackable_attributes(auth_object = nil)
    [ "confession_id", "created_at", "id", "id_value", "ip", "reaction_type", "updated_at" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id body ip created_at updated_at]
  end
end
