class DocumentStatesController < ApplicationController
  before_action :set_document_state, only: [ :edit, :update, :destroy]

  # GET /document_states
  # GET /document_states.json
  def index
    @document_states = DocumentState.all
  end

  # GET /document_states/new
  def new
    @document_state = DocumentState.new
  end

  # GET /document_states/1/edit
  def edit
  end

  # POST /document_states
  # POST /document_states.json
  def create
    @document_state = DocumentState.new(document_state_params)

    respond_to do |format|
      if @document_state.save
        format.html { redirect_to document_states_path, notice: 'Document state was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /document_states/1
  # PATCH/PUT /document_states/1.json
  def update
    respond_to do |format|
      if @document_state.update(document_state_params)
        format.html { redirect_to document_states_path, notice: 'Document state was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /document_states/1
  # DELETE /document_states/1.json
  def destroy
    @document_state.destroy
    respond_to do |format|
      format.html { redirect_to document_states_url, notice: 'Document state was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_state
      @document_state = DocumentState.find(params[:id])
    end

    def document_state_params
      params.fetch(:document_state, {})
      params.require(:document_state).permit(:value)
    end
end
