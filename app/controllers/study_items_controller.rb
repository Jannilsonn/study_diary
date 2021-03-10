class StudyItemsController < ApplicationController
    
    def show
        @study_item = StudyItem.find(params[:id])
    end

    def new
    end

    def create
        title = params[:title]
        category = params[:category]

        if !title.empty? && !category.empty?
            newItem = StudyItem.new(title: title, category: params[:category])
            newItem.save()
            redirect_to '/'
        end
    end

    def edit
        @study_item = StudyItem.find(params[:id])
    end

    def update
        study_item = StudyItem.find(params[:id])

        if params.key?("title") && params.key?("category")
            title = params[:title]
            category = params[:category]
    
            if !title.empty? && !category.empty?
                study_item.title = title
                study_item.category = category
                study_item.save()
                redirect_to '/'
            end 
        else
            study_item.done = params[:done]
            study_item.save()
            redirect_to '/'
        end
    end

    def destroy
        StudyItem.find(params[:id]).destroy()
        redirect_to '/'
    end
end