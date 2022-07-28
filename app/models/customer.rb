class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews

    def full_name
        "#{first_name} #{last_name}"
    end

    def favorite_restaurant
        reviews.max_by(&:star_rating).restaurant
    end

    def add_review(restaurant, rating)
        Review.create(restaurant: restaurant, star_rating: rating, customer: self)
    end

    def delete_reviews(restaurant)
        r = Review.where(restaurant: restaurant)
        r.destroy_all
    end

end

