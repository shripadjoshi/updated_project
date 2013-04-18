class ArticleType < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def as_xls(options = {})
    {
      "Article Type" => name
    }
  end

  define_index do
    indexes name, sortable: true
    set_property delta: true
  end
end
