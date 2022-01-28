class Client < User
  default_scope { where(role: :client) }

  has_many :visits, dependent: :destroy
end
