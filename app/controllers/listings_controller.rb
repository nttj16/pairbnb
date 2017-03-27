class ListingsController < ApplicationController
  def index
  end

  def new
    @listing = listing.new
  end

  def create
    @listing = Listing,new(listing_params)
    if @listing.save
      redirect_to listings_path
    end
  end
end
