class Picture < ApplicationRecord
    validates :artist, presence: true
    validates :title, length: {minimum: 3}
    validates :title, length: {maximum: 20}
    validates :url, presence: true
    validates :url, uniqueness: true
  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end
end
