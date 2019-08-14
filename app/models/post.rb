class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :validate_title_clickbait

    def validate_title_clickbait
        click_bait_strings = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if self.title
            if !click_bait_strings.any? {|string| self.title.include?(string)}
                errors.add(:title, "must be clickbaity")
            end
        end
    end
end
