# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'creator', class_name: 'Event'
  has_many :invitations, foreign_key: 'attendee', class_name: 'Invitation'
  has_many :attended_events, through: :invitations
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
