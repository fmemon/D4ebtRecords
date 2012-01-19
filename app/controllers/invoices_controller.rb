class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end
  def create
    @invoice = Invoice.new(params[:invoice])

      if @invoice.save
        redirect_to @invoice, notice: 'Invoice was successfully created.' 
      else
        render action: "new" 
      end
  end
  
  def update
    @invoice = Invoice.find(params[:id])

      if @invoice.update_attributes(params[:invoice])
        redirect_to @invoice, notice: 'Invoice was successfully updated.' 
      else
        render action: "edit" 
      end

  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

   redirect_to invoices_url
  end
end
