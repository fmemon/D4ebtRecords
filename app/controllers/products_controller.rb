class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
		  redirect_to @product, :notice => "Product #{@product.name} updated"
		else
		  render :edit
		end
  end
  
  def create
    @product = Product.new(params[:product])
		if @product.save
		  redirect_to @product, :notice => "Product #{@product.name} created"
		else
		  render :new
		end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to @product, :notice => "Product #{@product.name} deleted"
  end
  
  def search
    #@products = Product.find_all_by_name(params[:term])
    @products = nil
    @found = false
    
    @products = Product.find(:all, :conditions => ['LOWER(name) LIKE ? OR LOWER(description) LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%"])
    if @products.empty?
      if params[:term].blank? 
        flash.now[:notice] ="Please enter in a search term to search" 
      else
        flash.now[:notice] ="Sorry nothing found for #{params[:term]}" 
      end
      @products = Product.all
    else
      @found = true
    end
    render :index, :products => @products
  end

end
