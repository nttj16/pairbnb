class ListingsController < ApplicationController
before_action :find_listing, only: [:show, :edit, :update]
  def index
    @listings = Listing.all
    @listings = Listing.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      flash[:danger] = "Unable to save"
      render 'form'
    end
  end

  def show
  end

  def update
    if @listing.update(listing_params)
      flash[:success] = "Sucessfully updated listing"
      redirect_to @listing
    else
      flash[:danger] = "Error updating listing"
      render :edit
    end
  end

  def destroy
  end


  def listing_params
    params.require(:listing).permit(:title, :location, :description, :price, :max_guests)
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end


end
