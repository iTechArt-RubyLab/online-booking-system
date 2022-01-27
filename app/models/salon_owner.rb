class SalonOwner < User
  default_scope { where(role: :salon_owner) }

  validates :work_email, :work_phone, :status, presence: true

  has_many :salons, dependent: :destroy
end
