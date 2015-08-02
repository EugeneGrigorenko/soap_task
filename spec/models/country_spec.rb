require 'rails_helper'

describe Country do
  context 'Associations' do
    it { is_expected.to have_one(:currency).dependent(:destroy) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:code) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_length_of(:code).is_at_most(2) }
  end

  context 'methods' do
    it 'should find by code' do
      correct_code = Faker::Address.country_code
      correct = create(:country, code: correct_code)
      create(:country)
      result = Country.by_code(correct_code)
      expect(result).to eq(correct)
    end
  end
end
