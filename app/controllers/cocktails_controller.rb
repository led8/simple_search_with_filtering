class CocktailsController < ApplicationController
  def index
    if params["search"]
      @filter = params["search"]["categories"].concat(params["search"]["flavors"]).flatten.reject(&:blank?)
      @cocktails = @filter.empty? ? Cocktail.all : Cocktail.all.tagged_with(@filter, any: true)
      # @cocktails = Cocktail.all.global_search("#{@filter}")
    else
      @cocktails = Cocktail.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
