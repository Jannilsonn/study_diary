class HomeController < ApplicationController 
    def index
        
        @items = StudyItem.all()
    end
end