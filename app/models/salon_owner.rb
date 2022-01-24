class SalonOwner < User
  default_scope { where(role: :salon_owner) }
end
