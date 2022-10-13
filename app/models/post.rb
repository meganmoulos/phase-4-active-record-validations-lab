class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait? 

    def clickbait?
        if title == nil 
            false
        else
            titles = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]
            if titles.one?{|t| self.title.match(t)} 
                true
            else
                errors.add(:title, "title not found")
            end
        end
    end
end
