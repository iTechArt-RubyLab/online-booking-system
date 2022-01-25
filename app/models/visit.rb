class Visit < ApplicationRecord
  enum status: { created: 0, approved: 1, rejected_by_user: 2, rejected_by_client: 3, deleted: 4, finished: 5 }

  # belongs_to :client, foreign_key: :client_id
  # belongs_to :salon, foreign_key: :salon_id

  validates :start_at, :end_at, :price, :address, :status, presence: true
  validates :price, length: { minimum: 2 }
end
