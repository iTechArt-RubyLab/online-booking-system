# == Schema Information
#
# Table name: users_salons
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  salon_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UsersSalon < ApplicationRecord
  belongs_to :user
  belongs_to :salon
end
