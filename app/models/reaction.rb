class Reaction < ApplicationRecord
  belongs_to :confession

  def self.ransackable_associations(auth_object = nil)
    ["confession"]
  end

   def self.ransackable_attributes(auth_object = nil)
    ["confession_id", "created_at", "id", "id_value", "ip", "reaction_type", "updated_at"]
  end
end
