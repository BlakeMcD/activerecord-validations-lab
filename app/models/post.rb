class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ['Fiction', 'Non-Fiction']
    validate :is_clickbait?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]

    def is_clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
        end
    end


    # def title_must_contain_clickbait
    #     unless Post.title.match?(/Won't Believe|Secret|Top|Guess/)
    #         errors.add(:title, "must be clickbait")
    #     end
    # end
end
