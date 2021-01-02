class Task < ApplicationRecord
  # Validations
  validates :title, presence: true

  # Associations
  has_many :participants, dependent: :destroy

  # Methods
  def ordered_participants
    revealed? ? participants.order(vote: :desc) : participants.order(name: :asc)
  end
end
