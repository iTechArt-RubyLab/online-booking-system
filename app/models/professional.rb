class Professional < User
  default_scope { where(role: :professional) }
  
  validates :salon_id, presence: true
  validates :role, :status, presence: true
  validates :image_url, presence: true, url: true
  validates :work_email, presence: true,
                         uniqueness: { case_sensitive: false },
                         format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Work email invalid' },
                         length: { minimum: 4, maximum: 254 }  
  validates :work_phone, presence: true,
                         format: { with: /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/, message: 'Work phone invalid' }
end