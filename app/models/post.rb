class Post < ApplicationRecord
  belongs_to :user
  has_many :responses, class_name: "Post", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Post", optional: true
end
