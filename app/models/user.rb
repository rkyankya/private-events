class User < ApplicationRecord
  has_many :events, foreign_key: 'creator', class_name: 'Event',
                    dependent: :destroy
  has_many :invitations, foreign_key: 'attendee', class_name: 'Invitation'
  has_many :attended_events, through: :invitations
  has_many :permisions, foreign_key: 'allow', class_name: 'Invitation'
  validates :username, presence: true, uniqueness: { case_sensitive: false }, allow_blank: false
  validates :name, presence: true, allow_blank: false
end
