class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
    validate :clickbait?
    def clickbait?
        if ["Won't Believe", "Secret", "Top[#{(0..9).each { |int| int}}]" "Guess"].none? { |term| term == title}
            errors.add(:title, "must be clickbait")
        end
    end
end


# 1. All authors have a name
# 1. No two authors have the same name
# 1. Author phone numbers are exactly ten digits
# 1. All posts have a title
# 1. Post content is at least 250 characters long
# 1. Post summary is a maximum of 250 characters
# 1. Post category is either `Fiction` or `Non-Fiction`
#    This step requires an `inclusion` validator, which was not outlined in the
#Custom validator that ensures that the title is clickbait. ["Won't Believe", "Secret", "Top[number]" "Guess"]