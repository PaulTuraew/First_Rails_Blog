class Post < ActiveRecord::Base
  scope :latest, -> { limit(10) }
  scope :sorted, -> { order('published_at DESC') }
  scope :published, -> { where(draft: false) }

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("body LIKE? OR subject LIKE?", "%#{query}%", "%#{query}%")
  end

end
