class DocumentCategoriesController < ApplicationController
  before_action :set_document_category, only: [ :edit, :update, :destroy]

  # GET /document_categories
  # GET /document_categories.json
  def index
    @document_categories = DocumentCategory.all
  end

  # GET /document_categories/new
  def new
    @document_category = DocumentCategory.new
  end

  # GET /document_categories/1/edit
  def edit
  end

  # POST /document_categories
  # POST /document_categories.json
  def create
    @document_category = DocumentCategory.new(document_category_params)

    respond_to do |format|
      if @document_category.save
        format.html { redirect_to document_categories_path, notice: 'Document category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /document_categories/1
  # PATCH/PUT /document_categories/1.json
  def update
    respond_to do |format|
      if @document_category.update(document_category_params)
        format.html { redirect_to document_categories_path, notice: 'Document category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /document_categories/1
  # DELETE /document_categories/1.json
  def destroy
    @document_category.destroy
    respond_to do |format|
      format.html { redirect_to document_categories_url, notice: 'Document category was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_category
      @document_category = DocumentCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_category_params
      params.fetch(:document_category, {})
      params.require(:document_category).permit(:value)
    end
end
