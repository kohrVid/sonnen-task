require 'rails_helper'

RSpec.describe Position, type: :model do
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

  describe '#distance' do
    it "should return the distance of a position using pythagorean theorem" do
      expect(described_class.new(x: 0, y: 4).distance).to eq(4)
      expect(described_class.new(x: 3, y: 0).distance).to eq(3)
      expect(described_class.new(x: 3, y: 4).distance).to eq(5)
      expect(described_class.new(x: 5, y: 12).distance).to eq(13)
      expect(described_class.new(x: 32, y: 255).distance).to eq(257)
    end
  end
end
