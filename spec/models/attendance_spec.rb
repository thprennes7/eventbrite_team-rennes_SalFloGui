require 'rails_helper'

RSpec.describe Attendance, type: :model do

  before(:each) do
    @event = FactoryBot.create(:event)
    @user = FactoryBot.create(:user)
    @attendance = FactoryBot.create(:attendance)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end
  end

  context "associations" do
    it "should belong to User" do
      expect(@attendance.user).to eq(@user)
    end

    it "should belong to Event" do
      expect(@attendance.event).to eq(@event)
    end
  end

end
