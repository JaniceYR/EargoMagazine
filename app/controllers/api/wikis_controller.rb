class Api::WikisController < ApplicationController
  def index
    magazines = ["Popular Science", "PC Magazine", "TechCrunch", "Gizmodo", "The Verge", "GeekWire"]

    @wikis = Wiki.fetch_by_names(magazines)
    # @wikis = Wiki.fetch_by_names(wiki_params[:names])
    render json: @wikis
  end

  private

  def wiki_params
    params.require(:wiki).permit(:names)
  end
end
