class Professional < User
  default_scope { where(role: :professional) }
end