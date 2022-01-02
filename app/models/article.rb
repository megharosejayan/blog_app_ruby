class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimun:6, maximum: 100}
    validates :description, presence: true,length: {minimun:6, maximum: 300}
end