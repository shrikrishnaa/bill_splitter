require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  include Devise::Test::ControllerHelpers
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    admin = FactoryGirl.create(:user)
    sign_in(admin, scope: :user)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      event = Event.new(FactoryGirl.attributes_for(:event))
      event.user_event_details.build(user_id: subject.current_user.id,paid_amount:300)
      event.save
      get :show, params: {id: event.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      event = Event.new(FactoryGirl.attributes_for(:event))
      event.user_event_details.build(user_id: subject.current_user.id,paid_amount:300)
      event.save
      get :edit, params: {id: event.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, params: {event: {name: "Dinner",
            date: "11/11/2017",
            amount: "300",
            location: "Bangalore",user_ids:[subject.current_user.id],"paid_amount_#{subject.current_user.id}":300}}
        }.to change(Event, :count).by(1)
      end

      it "redirects to the created event" do
        post :create, params: {event: {name: "Dinner",
          date: "11/11/2017",
          amount: "300",
          location: "Bangalore",user_ids:[subject.current_user.id],"paid_amount_#{subject.current_user.id}":300}}
        expect(response).to redirect_to(Event.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {event: {name:""}}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested event" do
        event = Event.new(FactoryGirl.attributes_for(:event))
        event.user_event_details.build(user_id: subject.current_user.id,paid_amount:300)
        event.save
        put :update, params: {id: event.to_param, event: {location:"delhi"}}
        event.reload
        expect(event.location).to eq "delhi"
      end

      it "redirects to the event" do
        event = Event.new(FactoryGirl.attributes_for(:event))
        event.user_event_details.build(user_id: subject.current_user.id,paid_amount:300)
        event.save
        put :update, params: {id: event.to_param, event: {location:"delhi"}}
        expect(response).to redirect_to(event)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        event = Event.new(FactoryGirl.attributes_for(:event))
        event.user_event_details.build(user_id: subject.current_user.id,paid_amount:300)
        event.save
        put :update, params: {id: event.to_param, event: {name:""}}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      event = Event.new(FactoryGirl.attributes_for(:event))
      event.user_event_details.build(user_id: subject.current_user.id,paid_amount:300)
      event.save
      expect {
        delete :destroy, params: {id: event.to_param}
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.new(FactoryGirl.attributes_for(:event))
      event.user_event_details.build(user_id: subject.current_user.id,paid_amount:300)
      event.save
      delete :destroy, params: {id: event.to_param}
      expect(response).to redirect_to(events_url)
    end
  end

end
