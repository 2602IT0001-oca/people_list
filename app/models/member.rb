class Member < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { minimum: 1, maximum: 20 }
    validates :name, uniqueness: true

    validates :height, presence: { message: "must be entered" } 
    validates :weight, presence: { message: "must be entered" }

    validate :height_must_be_at_least_one
    validate :weight_must_be_at_least_one

    private

    def height_must_be_at_least_one
        return if height.blank?

        if height < 1
            errors.add(:height, "must be at lease 1")
        end
end

def weight_must_be_at_least_one
    return if weight.blank?

    if weight < 1
        errors.add(:weight, "must be at least 1")
    end
  end
end
