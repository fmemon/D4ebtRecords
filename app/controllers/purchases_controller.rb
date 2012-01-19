class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end
  
  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def create
    @purchase = Purchase.new(params[:purchase])

      if @purchase.save
        redirect_to @purchase, notice: 'Purchase was successfully created.' 
      else
        render action: "new" 
      end
  end

  def update
    @purchase = Purchase.find(params[:id])

      if @purchase.update_attributes(params[:purchase])
        redirect_to @purchase, notice: 'Purchase was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    redirect_to purchases_url
    end
end
