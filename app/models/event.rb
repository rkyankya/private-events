# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: 'attended_event', class_name: 'Invitation'
  has_many :attendees, through: :invitations
end
