# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_url  :string
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'does not pass validations' do
    context 'when name nil' do
      it { is_expected.to validate_presence_of :name }
    end
  end
end
