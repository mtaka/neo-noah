class Article < ApplicationRecord
  has_many :infos
  has_many :chapters
end
