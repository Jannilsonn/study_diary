class StudyItems
    attr_accessor :id, :title, :category
    @@last_id = 1
    def initialize(title:, category:)
        @id = @@last_id
        @title = title
        @category = category

        @@last_id += 1
    end

    def to_s
        "#{id} > #{title} - #{category}"
    end

end