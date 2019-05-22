class WorkLogTypesController < ApplicationController
  before_action :set_work_log_type, only: [:show, :edit, :update, :destroy]

  # GET /work_log_types
  # GET /work_log_types.json
  def index
    @work_log_types = WorkLogType.all
  end

  # GET /work_log_types/new
  def new
    @work_log_type = WorkLogType.new
  end

  # GET /work_log_types/1/edit
  def edit
  end

  # POST /work_log_types
  # POST /work_log_types.json
  def create
    @work_log_type = WorkLogType.new(work_log_type_params)

    respond_to do |format|
      if @work_log_type.save
        format.html { redirect_to work_log_types_path, notice: 'Worklog type was successfully created.' }
        format.json { render :show, status: :created, location: @work_log_type }
      else
        format.html { render :new }
        format.json { render json: @work_log_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_log_types/1
  # PATCH/PUT /work_log_types/1.json
  def update
    respond_to do |format|
      if @work_log_type.update(work_log_type_params)
        format.html { redirect_to work_log_types_path, notice: 'Worklog type was successfully updated.' }
        format.json { render :show, status: :created, location: @work_log_type }
      else
        format.html { render :edit }
        format.json { render json: @work_log_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_log_types/1
  # DELETE /work_log_types/1.json
  def destroy
    @work_log_type.destroy
    respond_to do |format|
      format.html { redirect_to work_log_types_url, notice: 'Worklog type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_log_type
      @work_log_type = WorkLogType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_log_type_params
      params.fetch(:work_log_type, {})
      params.require(:work_log_type).permit(:value)
    end
end
