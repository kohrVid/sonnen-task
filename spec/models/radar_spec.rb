require 'rails_helper'

RSpec.describe Radar, type: :model do
  subject { described_class.new }

  describe '#position' do
    before do
      subject.save
    end

    it 'must be present' do
      expect(subject).to_not be_valid
      expect(subject.errors[:position]).to include("must exist")
    end
  end
end
