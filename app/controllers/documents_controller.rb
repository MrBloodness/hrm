class DocumentsController < ApplicationController


  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
      else
        @document.valid?
        format.html { render 'documents/new.html.slim' }
      end
    end
  end

  def update
    @document = Document.find(params[:id])
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
    end
  end

  private

    def document_params
      params.require(:document).permit(:number, :title, :employee_id, :document_state_id, :document_category_id,
        :document_date, :deadline_date, :file, :file_content_type, :file_file_name, :file_file_size, :file_updated_at)
    end

end
