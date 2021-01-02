module ApplicationHelper
  def display_vote(participant)
    content_tag :div, class: 'text-success' do
      if participant.task.revealed?
        if participant.vote.nil?
          '-'
        elsif participant.vote == 99
          '?'
        else
          participant.vote.to_s
        end
      else
        'Voted!' if participant.vote.present?
      end
    end
  end
end
