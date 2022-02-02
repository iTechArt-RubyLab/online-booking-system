module Authorization
  exted ActiveSupport::Concern

  included do
    include Pundit
  end
end
