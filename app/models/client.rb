class Client < User
  default_scope { where(role: :client) }

  #validates :rating, :work_email, :work_phone_number, :status, :salon_id, allow_blank: true
end