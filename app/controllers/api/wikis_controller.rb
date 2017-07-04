class Api::WikisController < ApplicationController
  def index
    @wikis = Wiki.fetch_by_names(wiki_params)
    render json: @wikis
  end

  private

  def wiki_params
    params.require(:names)
  end
end
