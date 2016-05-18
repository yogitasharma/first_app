class DocumentsController < ApplicationController
  def index
  	@documents = Document.all
  end

  def new
  	@document = Document.new
  end

  def create
  	@document = Document.new(document_params)
      if @document.save
      	File.open(Rails.root.join('public','FilesUploaded',@document.name),'wb') do |f|
      		f.write(@document.attachment.read)
      	end
         redirect_to documents_path, notice: "The document #{@document.name} has been uploaded."
      else
         render "new"
      end
  end

  def destroy
  	@document = Document.find(params[:id])
      @document.destroy
      redirect_to documents_path, notice:  "The document #{@document.name} has been deleted."
  end

  def download
  	filetodownload= params[:id]
  	send_file Rails.root.join('public','FilesUploaded',filetodownload)
  end

  private
      def document_params
      params.require(:document).permit(:name, :attachment)
   end
end
