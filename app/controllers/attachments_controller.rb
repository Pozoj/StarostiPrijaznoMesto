class AttachmentsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @holder = find_holder
    @photo = Attachment.new
    @photo.holder = @holder
  end

  def create
    @holder = find_holder
    @photo = @holder.attachments.build(params[:attachment])
    if @photo.save
      flash.now[:notice] = "Fotografija je bila uspešno dodana."
      redirect_to @holder
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @photo = Attachment.find(params[:id])
    @holder = @photo.holder
    @photo.destroy
    flash.now[:notice] = "Uspešno ste izbrisali fotografijo."
    redirect_to @holder
  end

  private

  def find_holder
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end