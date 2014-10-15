class Post < ActiveRecord::Base

  def self.chrono_limit
    order('published_at DESC').limit(10)
  end

end
