require 'rails_helper'

RSpec.describe Slot, type: :model do
  describe 'validations' do
    let!(:coach) { create(:user, :coach) }
    let!(:slot) { build(:slot, coach_id: coach.id) }

    it 'is true if attributes are valid' do
      expect(slot.valid?).to be(true)
    end

    it 'is false if coach is not present' do
      slot.coach = nil
      expect(slot.valid?).to be(false)
    end

    it 'is false if start_time is not present' do
      slot.start_time = nil
      expect(slot.valid?).to be(false)
    end

    it 'is false if end_time is not present' do
      slot.end_time = nil
      expect(slot.valid?).to be(false)
    end

    it 'is false if rate is not in 1..5' do
      slot.rate = 6
      expect(slot.valid?).to be(false)
    end
  end
end
