class HomeController < ApplicationController 
    def index
        @items = []
        @items << StudyItems.new(title: 'HTTP', category: 'Web')
        @items << StudyItems.new(title: 'MVC', category: 'Rails')
    end

    def update
    end
end