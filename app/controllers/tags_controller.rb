class TagsController < ApplicationController
	def new
		@tag = Tag.new 
	end

	def create 
		@tag = Tag.new(param[:tag])
	end
end
