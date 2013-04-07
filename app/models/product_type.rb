class ProductType < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :products, dependent: :destroy

  def as_xls(options = {})
    {
      "Product Type" => name,
    }
  end

  define_index do
    indexes name, sortable: true
    set_property delta: true
  end
end
