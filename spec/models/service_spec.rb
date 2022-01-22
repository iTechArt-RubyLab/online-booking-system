require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:salon_id) }
  end
end
