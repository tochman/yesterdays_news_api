RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:role).of_type(:integer) }

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
