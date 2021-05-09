class LinksController < ApplicationController

  def create
    shortener = Shortener.new(link_params[:original_url])
    @link = shortener.generate_short_link

    if @link.persisted?
      respond_to :js
    else
      render 'error.js.erb'
    end
  end

  def show
    head :ok
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
