RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:role).of_type(:integer) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
  end

  describe 'Factory' do
    it 'is expected to have a valid Factory' do
      expect(create(:user)).to be_valid
    end
  end

  describe 'Class methods' do
    describe 'role' do
      it { expect(described_class).to respond_to :journalist }
      it { expect(described_class).to respond_to :editor }
    end
  end

  describe 'Instance methods' do
    it { is_expected.to respond_to :journalist? }
    it { is_expected.to respond_to :editor? }

    it { is_expected.to respond_to :journalist! }
    it { is_expected.to respond_to :editor! }
  end
end
