# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'creator', class_name: 'Event'
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
