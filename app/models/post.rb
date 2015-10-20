class Post < ActiveRecord::Base
  validates :title, :content, :presence => true
  has_and_belongs_to_many :tags

  before_save(:title_case)

  private
    def title_case
      title = self.title.downcase
      words = title.split(' ')
      words.map do |word|
        word.capitalize!
      end
      self.title = words.join(' ')
    end


end
