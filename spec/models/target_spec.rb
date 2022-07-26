require 'rails_helper'

RSpec.describe Target, type: :model do
  subject { described_class.new }

  describe '#radar' do
    before do
      subject.save
    end

    it 'must be present' do
      expect(subject).to_not be_valid
      expect(subject.errors[:radar]).to include("must exist")
    end
  end
end
