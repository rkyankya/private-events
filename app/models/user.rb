# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
