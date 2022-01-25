class Professional < User
  default_scope { where(role: :professional) }

  has_many :professionals_salons, dependent: :destroy
  has_many :salons, through: :professionals_salons
end
