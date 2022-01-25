class Client < User
  default_scope { where(role: :client) }
end
