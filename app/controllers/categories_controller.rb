class CategoriesController < ApplicationController
	before_action :find_category, only: [:show, :edit, :update, :destroy]

def index
		@flavors = Category.all
	end

	def show
	end

	def new
		@flavor = Category.new
	end

	def create

		@flavor = Category.new(category_params)

		if @flavor.save
			redirect_to @flavor
		else
			render 'new'
		end

	end

	def edit
	end

	def update
		@flavor = Category.update_attributes(category_params)

		if @flavor.save
			redirect 'show'
		else
			render 'new'
		end
	end

	def destroy
		@flavor.detroy
	end

	private

	def category_params
    	params.require(:category).permit(:title, :description, :image)
	end

	def find_category
		@flavor = Category.find(params[:id])
	end



end
