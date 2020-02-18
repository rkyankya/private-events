require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'Invitation has a attended_event, attendee and accepted' do
    it 'must have a attended event and attendee' do
      user = User.new(name: 'foo', username: 'foobar')
      user.save
      event = user.events.build(description: 'foo', date: Time.now, location: 'My house')
      event.save
      invitation = user.invitations.build
      expect(invitation.save).to be false
      invitation.attended_event = event
      expect(invitation.save).to be true
    end

    it 'must not have blank fields' do
      user = User.new(name: 'foo', username: 'foobar')
      user.save
      event = user.events.build(description: 'foo', date: Time.now, location: 'My house')
      event.save
      invitation = user.invitations.build(attended_event: event)
      invitation.save
      expect(invitation.accepted).to be false
    end
  end
end
