class SalonOwner < User
  default_scope { where(role: :salon_owner) }

  has_many :salons, dependent: :destroy
end
