class SalonOwner < User
  default_scope { where(role: :salon_owner) }

  # validates :rating, allow_blank: true
end
