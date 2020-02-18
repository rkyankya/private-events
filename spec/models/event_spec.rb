require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Event has a date, description, location and creator' do
    it 'must have a creator' do
      event = Event.new(description: 'foo', date: Time.now, location: 'My house')
      expect(event.save).to be false
    end

    it 'must not have blank fields' do
      user = User.new(name: 'foo', username: 'foobar')
      event = user.events.build
      expect(event.save).to be false
      event.description = 'foo'
      expect(event.save).to be false
      event.date = Time.now
      expect(event.save).to be false
      event.description = ''
      event.location = 'My house'
      expect(event.save).to be false
    end
  end
end
