class AddressesController < ApplicationController
  respond_to :html, :json, :xml

  def show
    @address = Address.find(params[:id])
    respond_with @address
  end

end