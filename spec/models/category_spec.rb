RSpec.describe Category, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'Factory' do
    it 'is expected to have a valid Factory' do
      expect(create(:category)).to be_valid
    end
  end
  describe 'Associations' do
    it { is_expected.to have_many(:articles) }
  end
end
