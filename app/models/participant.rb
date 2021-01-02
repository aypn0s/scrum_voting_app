class Participant < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true

  # Associations
  belongs_to :task, touch: true

  # Methods
  def self.generate_name
    new_name = "User #{rand(999)}"
    find_by(name: new_name).present? ? generate_name : new_name
  end
end
