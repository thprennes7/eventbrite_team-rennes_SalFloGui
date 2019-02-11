require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do
    @event = FactoryBot.create(:event)
    @user = FactoryBot.create(:user)
    @attendance = FactoryBot.create(:attendance)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end
  end

  context "associations" do
    it { should have_many(:users).through(:attendances) }
  end
end
