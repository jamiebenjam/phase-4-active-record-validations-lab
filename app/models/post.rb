class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { :in => ['Fiction', 'Non-Fiction']}
    validate :title_is_clickbait

    def title_is_clickbait
        ["Won't Believe", "Secret", "Top [number]", "Guess"].map do |clickbait|
            if title&.include?(clickbait)
                return true
            end
        end

        errors.add(:title, 'title is not clickbait')           
    end

end
