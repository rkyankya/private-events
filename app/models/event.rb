class Event < ApplicationRecord
  scope :past, -> { where('date < ?', Time.now) }
  scope :upcom, -> { where('date > ?', Time.now) }
  default_scope { order('date DESC') }
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: 'attended_event', class_name: 'Invitation'
  has_many :attendees, through: :invitations
  validates :description, presence: true, allow_blank: false
  validates :date, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false
end
