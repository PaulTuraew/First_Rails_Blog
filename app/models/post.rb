class Post < ActiveRecord::Base

  def self.chrono_limit
    order('published_at DESC').limit(10)
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("body LIKE? OR subject LIKE?", "%#{query}%", "%#{query}%")
  end

end
