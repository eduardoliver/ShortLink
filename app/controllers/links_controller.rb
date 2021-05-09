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
    @link = Link.find_by(lookup_code: lookup_code_params)
    redirect_to @link.original_url
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def lookup_code_params
    params.require(:lookup_code)
  end

end
