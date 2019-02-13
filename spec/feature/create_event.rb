require 'rails_helper'
require 'capybara/rspec'

describe 'create_event', type: :feature do

  before :all do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event)
    @attendance = FactoryBot.create(:attendance)
  end

  it "creates an event" do
    visit '/users/sign_in'

    within("#new_user") do
      fill_in 'Email', with: "#{@user.email}"
      fill_in 'Password', with: "#{@user.password}"
    end

    click_on 'Log in'

    click_link 'Créer un event'

    within("#new_event") do
      fill_in 'Titre', with: "#{@event.title}"
      fill_in 'Description', with: "#{@event.description}"
      fill_in 'Prix', with: "#{@event.price}"
      fill_in 'location', with: "#{@event.location}"
      select '2020', from: 'event[start_date(1i)]'
      select 'February', from: 'event[start_date(2i)]'
      select '25', from: 'event[start_date(3i)]'
      select '19', from: 'event[start_date(4i)]'
      select '19', from: 'event[start_date(5i)]'
      fill_in 'Durée', with: "#{@event.duration}"
    end

    click_button 'Créer'

    expect(page).to have_content 'créé'
  end
  
end
