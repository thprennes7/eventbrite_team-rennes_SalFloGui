require 'rails_helper'

RSpec.describe "events/show.html.erb", type: :view do
  context 'when diplaying an event' do
    it "shows the button when is the creator" do
      @user = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      # assign(:event, @event)
      @creator = @event.user
      @participants = @event.users

      def is_linked_to?(user)
        false
      end

      render

      expect(rendered).to match /Gestion de l'évènement/
    end

    it 'hides the button when not connected' do
      @user = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      # assign(:event, @event)
      @creator = @event.user
      @participants = @event.users

      def is_linked_to?(user)
        false
      end

      render

      expect(rendered).not_to match /Gestion de l'évènement/
    end

    it 'displays the details' do
      assign(:user, build(:user, first_name: "Salome", last_name: "Marzin", email: "salom@salom.fr", password: "jenaimarre", description: "ceci est une description"))
      assign(:event, build(:event, title: "gros evenement", start_date: "2019-02-11 16:05:49", duration: 30, description: "olala, quel gros evenement !", price: 100, location: "Rennes", user_id: User.last.id))
      assign(:attendance, build(:attendance, user_id: User.last.id, event_id: Event.last.id, stripe_customer_id: "b"))

      render

      expect(rendered).to match /2019-02-11 16:05:49/
      expect(rendered).to match /5/
      expect(rendered).to match /MyString/
      expect(rendered).to match /1/
    end
  end
end
