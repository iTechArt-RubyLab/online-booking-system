require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:random_user)).to be_valid
    end

    it 'is not valid with nil first_name' do
      expect(build(:random_user, first_name: nil)).not_to be_valid
    end

    it 'is not valid with nil last_name' do
      expect(build(:random_user, last_name: nil)).not_to be_valid
    end

    it 'is not valid with nil salon_id' do
      expect(build(:random_user, salon_id: nil)).not_to be_valid
    end

    it 'is not valid with nil email' do
      expect(build(:random_user, email: nil)).not_to be_valid
    end

    it 'is not valid with nil work_email' do
      expect(build(:random_user, work_email: nil)).not_to be_valid
    end

    it 'is not valid with nil phone' do
      expect(build(:random_user, phone: nil)).not_to be_valid
    end

    it 'is not valid with nil work_phone' do
      expect(build(:random_user, work_phone: nil)).not_to be_valid
    end

    it 'is not valid with nil birthday' do
      expect(build(:random_user, birthday: nil)).not_to be_valid
    end

    it 'is not valid with nil role' do
      expect(build(:random_user, role: nil)).not_to be_valid
    end

    it 'is not valid with nil status' do
      expect(build(:random_user, status: nil)).not_to be_valid
    end

    it 'is not valid with nil image_url' do
      expect(build(:random_user, image_url: nil)).not_to be_valid
    end

    it 'is valid with nil notes' do
      expect(build(:random_user, notes: nil)).to be_valid
    end

    it 'is valid with nil patronymic' do
      expect(build(:random_user, patronymic: nil)).to be_valid
    end
  end
end
