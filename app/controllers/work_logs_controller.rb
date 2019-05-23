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
      else
        @work_log.valid?
        format.html { render 'work_logs/new.html.slim' }
      end
    end
  end

  def index
    @work_logs = WorkLog.all
  end

  def edit
    @work_log = WorkLog.find(params[:id])
  end

  def update
    @work_log = WorkLog.find(params[:id])
    respond_to do |format|
      if @work_log.update(work_log_params)
        format.html { redirect_to @work_log, notice: 'Worklog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @work_log = WorkLog.find(params[:id])
    @work_log.destroy
    respond_to do |format|
      format.html { redirect_to work_logs_url, notice: 'Worklog was successfully destroyed.' }
    end
  end

  private

    def work_log_params
      params.require(:work_log).permit(:employee_id, :spent_time, :work_log_type_id, :log_date, :comment, :created_at)
    end
end
