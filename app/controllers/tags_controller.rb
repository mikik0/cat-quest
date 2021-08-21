class TagsController < ApplicationController

    def contents
        @contents = Content.all
        render json: @contents
    end

    def index
        @tags = Tag.all
        render json: @tags
    end
    
    def create
        @tag = Tag.new(tag_params)
        if @tag.save
          render json: { status: 'SUCCESS', data: @tag }
        else
          render json: { status: 'ERROR', data: @tag.errors }
        end
    end

    def tag_params
        params.require(:tag)
    end
end
