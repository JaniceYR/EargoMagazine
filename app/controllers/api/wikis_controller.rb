class Api::WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    render "api/wikis/index"
  end

  private

  def wiki_params
    params.require(:wiki).permit(:names)
  end
end
