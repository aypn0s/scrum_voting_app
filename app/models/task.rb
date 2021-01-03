class Task < ApplicationRecord
  after_update_commit { broadcast_replace_to 'task', target: 'task_form', partial: 'tasks/form', 
    locals: { task: self } }

  after_update_commit { broadcast_replace_to 'task', target: 'participants', 
    partial: 'participants/participant', locals: { task: self } }

  after_update_commit { broadcast_replace_to 'task', target: 'reset_form', 
    partial: 'tasks/reset_form', locals: { task: self } }
  
  # Validations
  validates :title, presence: true

  # Associations
  has_many :participants, dependent: :destroy

  # Methods
  def ordered_participants
    revealed? ? participants.order(vote: :desc) : participants.order(name: :asc)
  end
end
