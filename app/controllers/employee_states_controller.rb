class EmployeeStatesController < ApplicationController
  before_action :set_employee_state, only: [:show, :edit, :update, :destroy]

  # GET /employee_states
  # GET /employee_states.json
  def index
    @employee_states = EmployeeState.all
  end

  # GET /employee_states/new
  def new
    @employee_state = EmployeeState.new
  end

  # GET /employee_states/1/edit
  def edit
  end

  # POST /employee_states
  # POST /employee_states.json
  def create
    @employee_state = EmployeeState.new(employee_state_params)

    respond_to do |format|
      if @employee_state.save
        format.html { redirect_to @employee_state, notice: 'Employee state was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /employee_states/1
  # PATCH/PUT /employee_states/1.json
  def update
    respond_to do |format|
      if @employee_state.update(employee_state_params)
        format.html { redirect_to @employee_state, notice: 'Employee state was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /employee_states/1
  # DELETE /employee_states/1.json
  def destroy
    @employee_state.destroy
    respond_to do |format|
      format.html { redirect_to employee_states_url, notice: 'Employee state was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_state
      @employee_state = EmployeeState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_state_params
      params.fetch(:employee_state, {})
      params.require(:employee_state).permit(:value)
    end
end
