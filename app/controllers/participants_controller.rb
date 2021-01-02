class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:update]

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to task_path(@participant.task) }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote_form
    @participant = Participant.find(params[:participant_id])
    @vote_options = [
      [1, 1],
      [2, 2],
      [3, 3],
      [5, 5],
      [8, 8],
      [13, 13],
      [21, 21],
      [34, 34],
      ['?', 99],
    ]
  end

  def update_vote
    @participant = Participant.find(params[:participant_id])
    @participant.update(participant_params)
    respond_to do |format|
      format.html { redirect_to participant_vote_form_path(@participant) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(:name, :vote, :task_id)
    end
end
