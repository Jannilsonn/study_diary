class StudyItemsController < ApplicationController
    
    def show
        @study_item = StudyItem.find(params[:id])
    end

    def new
        @study_item = StudyItem.new
    end

    def create
        data = params.require(:study_item).permit(:title, :category, :description)
        @study_item = StudyItem.new(data)

        if @study_item.save
            redirect_to root_path
        else
            @title_error = @study_item.errors[:title].join(", ")
            @category_error = @study_item.errors[:category].join(",")
            render 'new'
        end
    end

    def edit
        @study_item = StudyItem.find(params[:id])
    end

    def update
        data = params.require(:study_item).permit(:title, :category, :done, :description)
        @study_item = StudyItem.find(params[:id])

        if data.key?("done")
            @study_item.done = (1 - data[:done].to_i)
            @study_item.save
            redirect_to root_path
        else
            @study_item.title = data[:title]
            @study_item.category = data[:category]
            @study_item.description = data[:description]
            
            if @study_item.save
                redirect_to root_path
            else
                @title_error = @study_item.errors[:title].join(", ")
                @category_error = @study_item.errors[:category].join(", ")
                @description_error = @study_item.errors[:description].join(", ")
                render 'edit'
            end
        end
    end

    def destroy
        StudyItem.find(params[:id]).destroy()
        redirect_to root_path
    end
end