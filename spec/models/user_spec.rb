require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @event = FactoryBot.create(:event)
    @user = FactoryBot.create(:user)
    @attendance = FactoryBot.create(:attendance)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
  end

  context 'associations' do
    it { should have_many(:events).through(:attendances) }
  end
end
