class StudyItemsController < ApplicationController
    def show
        @study_item = set_study_item
    end

    def new
        @study_item = StudyItem.new
    end

    def create
        @study_item = StudyItem.new(study_item_params)

        if @study_item.save
            redirect_to root_path
        else
            @title_error = @study_item.errors[:title].join(", ")
            @category_error = @study_item.errors[:category].join(",")
            render 'new'
        end
    end

    def edit
        @study_item = set_study_item
    end

    def update
        @study_item = set_study_item
        @study_item.update(study_item_params)
        
        if @study_item.save
            redirect_to root_path
        else
            @title_error = @study_item.errors[:title].join(", ")
            @category_error = @study_item.errors[:category].join(", ")
            @description_error = @study_item.errors[:description].join(", ")
            render 'edit'
        end
    end

    def update_done
        set_study_item.update(done: (1 - study_item_params[:done].to_i))
        set_study_item.save
        redirect_to root_path
    end

    def destroy
        set_study_item.destroy
        redirect_to root_path
    end

    private
        def set_study_item
            StudyItem.find(params[:id])
        end

        def study_item_params
            params.require(:study_item).permit(:title, :category, :done, :description)
        end
end