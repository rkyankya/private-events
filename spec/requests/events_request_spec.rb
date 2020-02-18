require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'Users logic with events' do
    user1 = User.find_by(username: 'fo1')
    if user1.nil?
      user1 = User.create!(name: 'Foo Bar 1', username: 'fo1')
      user2 = User.create!(name: 'Foo Bar 2', username: 'fo2')
      user3 = User.create!(name: 'Foo Bar 3', username: 'fo3')
      user4 = User.create!(name: 'Foo Bar 4', username: 'fo4')
      event1 = user1.events.build(description: 'Foo 1', date: 1.month.from_now, location: 'My house')
      event1.save
      event2 = user2.events.build(description: 'Foo 2', date: 1.month.ago, location: 'My house')
      event2.save
      invitation1 = user3.invitations.build(attended_event: event2)
      invitation1.save
    else
      user1 = User.find_by(username: 'fo1')
      user2 = User.find_by(username: 'fo2')
      user3 = User.find_by(username: 'fo3')
      user4 = User.find_by(username: 'fo4')
      event2 = Event.find_by(creator: user2)
      invitation1 = Invitation.find_by(attendee: user3)
    end

    it 'should login and logout' do
      get '/login'
      expect(response).to render_template(:new)
      post '/login', params: { session: { username: user1.username } }
      expect(response).to redirect_to(user_path(user1))
      delete '/logout'
      follow_redirect!
      expect(response).to redirect_to(login_path)
    end

    it 'should have the users created events, and it can create new event' do
      get '/login'
      post '/login', params: { session: { username: user1.username } }
      follow_redirect!
      expect(response.body).to include(user1.events.first.description.to_s)
      get '/events/new'
      expect(response).to render_template(:new)
      post '/events', params: { event: { description: 'Foobar', date: 1.day.from_now, location: 'Foobar' } }
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include(user2.name.to_s, user3.name.to_s, user4.name.to_s)
    end

    it 'should display a button if you are invited to an event' do
      get '/login'
      post '/login', params: { session: { username: user4.username } }
      get user_event_path(user2, event2)
      expect(response.body).to_not include("I've changed my mind", "I'm going")
      delete '/logout'
      get '/login'
      post '/login', params: { session: { username: user3.username } }
      get user_event_path(user2, event2)
      if invitation1.accepted
        expect(response.body).to include('I&#39;ve changed my mind')
        post user_event_path(user2, event2)
        follow_redirect!
        expect(response.body).to include('I&#39;m going')
      else
        expect(response.body).to include('I&#39;m going')
        post user_event_path(user2, event2)
        follow_redirect!
        expect(response.body).to include('I&#39;ve changed my mind')
      end
    end
  end
end
