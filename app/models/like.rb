class Like < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :likeable, polymorphic: true, required: false

  validates :user, presence: true
  validates :likeable, presence: true
end
