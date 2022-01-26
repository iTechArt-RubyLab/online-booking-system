class Visit < ApplicationRecord
  enum status: { created: 0,
                 approved: 1,
                 rejected_by_user: 2,
                 rejected_by_client: 3,
                 deleted: 4,
                 finished: 5 }

  belongs_to :client, class_name: 'Client'
  belongs_to :salon

  has_many :visits_services, dependent: :destroy
  has_many :services, through: :visits_services

  validates :start_at, :end_at, :price, :address, :status, presence: true
  validates :price, length: { minimum: 2 }
end
