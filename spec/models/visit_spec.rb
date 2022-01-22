require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:random_visit)).to be_valid
    end

    it 'is not valid with nil start_at' do
      expect(build(:random_visit, start_at: nil)).not_to be_valid
    end

    it 'is not valid with nil end_at' do
      expect(build(:random_visit, end_at: nil)).not_to be_valid
    end

    it 'is not valid with nil price' do
      expect(build(:random_visit, price: nil)).not_to be_valid
    end

    it 'is not valid with nil adress' do
      expect(build(:random_visit, adress: nil)).not_to be_valid
    end

    it 'is not valid with nil status' do
      expect(build(:random_visit, status: nil)).not_to be_valid
    end
  end
end
