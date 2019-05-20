class WorkLogsController < ApplicationController

  def show
    @work_log = WorkLog.find(params[:id])
  end

  def new
    @work_log = WorkLog.new
  end

  def create
    @work_log = WorkLog.new(work_log_params)

    respond_to do |format|
      if @work_log.save
        format.html { redirect_to @work_log, notice: 'Worklog was successfully created.' }
        format.json { render :show, status: :created, location: @work_log }
      else
        @work_log.valid?
        format.html { render 'work_logs/new.html.slim' }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @work_logs = WorkLog.all
  end

  def destroy
    @work_log = WorkLog.find(params[:id])
    @work_log.destroy
    respond_to do |format|
      format.html { redirect_to work_logs_url, notice: 'Worklog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def work_log_params
      params.require(:work_log).permit(:employee_id, :spent_time, :created_at)
    end
end
