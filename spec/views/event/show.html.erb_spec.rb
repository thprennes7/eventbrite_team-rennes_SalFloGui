require 'rails_helper'

RSpec.describe "events/show.html.erb", type: :view do
  before { allow(controller).to receive(:current_user) { @user } }
  context 'when diplaying an event' do
    it "shows the button when is the creator" do
      @user = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      # assign(:event, @event)
      @creator = @event.user
      @participants = @event.users

      def is_creator?(user)
        true
      end

      def is_not_linked_to(user)
        true
      end

      render

      expect(rendered).to match /Gestion/
    end

    it 'hides the button when not connected' do
      @user = FactoryBot.create(:user)
      @creator = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      # assign(:event, @event)
      @participants = @event.users

      def is_creator?(user)
        false
      end

      def is_not_linked_to(user)
        true
      end

      render

      expect(rendered).not_to match /Gestion/
    end

    it 'hides the button when already participating' do
      @user = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      # assign(:event, @event)
      @creator = @event.user
      @participants = @event.users

      def is_creator?(user)
        false
      end
      def is_not_linked_to(user)
        false
      end

      render

      expect(rendered).not_to match /inscrire/
    end

    it 'shows the button when connected' do
      @user = FactoryBot.create(:user)
      @creator = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      # assign(:event, @event)
      @participants = @event.users

      def is_creator?(user)
        false
      end
      def is_not_linked_to(user)
        true
      end

      render

      expect(rendered).to match /inscrire/
    end

    it 'displays the details' do
      @user = FactoryBot.create(:user)
      @creator = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      @participants = @event.users

      def is_creator?(user)
        false
      end
      def is_not_linked_to(user)
        true
      end

      render

      expect(rendered).to match /2019-02-11 16:05:49/
      expect(rendered).to match /5/
      expect(rendered).to match /MyString/
      expect(rendered).to match /1/
    end
  end
end
