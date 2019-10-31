class CocktailsController < ApplicationController
  def index
    if params["search"]
      @filter = params["search"]["categories"].concat(params["search"]["flavors"]).flatten.reject(&:blank?)
      @name = params["search"]["names"]
      if @filter.empty?
        @coktails = Cocktail.all.where("name ILIKE ?", "%#{@name}%")
      elsif params["search"]["names"].nil?
        @cocktails = Cocktail.all.tagged_with(@filter, any: true)
      elsif !@filter.empty? && !params["search"]["names"].nil?
        @cocktails = @filter.empty? ? Cocktail.all : Cocktail.all.tagged_with(@filter, any: true).where("name ILIKE ?", "%#{@name}%")
      else
        @cocktails = Cocktail.all
      end
    else
      @cocktails = Cocktail.all
    end
    respond_to do |format|
      format.html
      format.js
    end
    @cocktails_names = Cocktail.pluck(:name).sort
  end
end
