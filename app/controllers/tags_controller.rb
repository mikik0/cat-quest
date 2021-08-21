class TagsController < ApplicationController

    def index
        @content = Content.all
        render json: @content
    
    def 
