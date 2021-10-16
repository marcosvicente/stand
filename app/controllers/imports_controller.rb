class ImportsController < ApplicationController
  
  def create
    @import  = Import.new(import_params)
    if @import.save
      ImportsWorker.perform_async(@import.id)
      render :json => @import, :status => :ok
    else
      render :json => @import.error.full_message, :status => :bad_request
    end
  end 

  private 
  def import_params
    params.require(:import).permit(:file)
  end
end