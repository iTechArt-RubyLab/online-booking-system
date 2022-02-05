# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string           not null
#  last_name              :string           not null
#  middle_name            :string
#  email                  :string           not null
#  work_email             :string
#  phone                  :string           not null
#  work_phone             :string
#  birthday               :datetime         not null
#  role                   :integer          default("professional"), not null
#  status                 :integer          default("working")
#  notes                  :text
#  rating                 :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  tokens                 :json
#
class UserSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :middle_name, :email,
             :work_email, :phone, :work_phone, :birthday, :role,
             :status, :notes, :rating
end
