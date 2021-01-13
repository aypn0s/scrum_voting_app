class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :reset]

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      @tasks = Task.all
      render :index
    end
  end

  def show
    handle_participant
  end

  def update  
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def reset
    @task.participants.update_all(vote: nil)
    @task.update(revealed: false, title: 'Initial subject')
    redirect_to task_path(@task)
  end

  def destroy
    Task.find(params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.first_or_create(title: 'Initial subject')
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :revealed)
    end

    def handle_participant
      if session[:current_user_id].present?
        if Participant.exists?(session[:current_user_id])
          @participant = Participant.find(session[:current_user_id])
        else
          init_participant
        end
      else
        init_participant
      end
    end

    def init_participant
      @participant = @task.participants.create(name: Participant.generate_name)
      session[:current_user_id] = @participant.id
    end
end
