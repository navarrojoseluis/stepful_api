require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { build(:user) }

    it 'is valid if name is present' do
      expect(user.valid?).to be(true)
    end

    it 'is not valid if name is not present' do
      user.name = nil
      expect(user.valid?).to be(false)
    end
  end
end
