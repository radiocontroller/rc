class Article < ActiveRecord::Base
  enum category: [:homepage]
end
