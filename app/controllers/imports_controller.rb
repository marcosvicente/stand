class ImportsController < ApplicationController

  
  def create
    @import  = Import.new(import_params)

    if @import.save
      render :json => @import, :status => :ok
    else
      render :json => @import.error.full_message, :status => :bad_request
    end
  end 

  private 
  def import_params
    params.require(:dog).permit(:name, :date, :file)
  end
end