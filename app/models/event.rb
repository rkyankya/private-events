# frozen_string_literal: true

class Event < ApplicationRecord
  scope :past, -> { where('date < ?', Time.now) }
  scope :upcom, -> { where('date > ?', Time.now) }
  default_scope { order('date DESC') }
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: 'attended_event', class_name: 'Invitation'
  has_many :attendees, through: :invitations
end
