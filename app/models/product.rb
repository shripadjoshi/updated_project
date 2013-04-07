class Product < ActiveRecord::Base
  attr_accessible :application_direction, :ingredients, :name, :price, :sku,
                  :brand_id, :product_type_id, :full_name

  before_save :set_full_name

  validates :sku,:ingredients, :name, :price, :brand_id, :product_type_id, presence: true
  validates :price, numericality: true
  validates :sku, uniqueness: {case_sensitive: false}

  belongs_to :brand
  delegate :name, to: :brand, prefix: true, allow_nil: true

  belongs_to :product_type
  delegate :name, to: :product_type, prefix: true, allow_nil: true

  has_many :additional_claims

  def fetch_additional_claims(user, params)
    all_additional_claims = (if user.has_role? :admin
      self.additional_claims
    else
      self.additional_claims.fetch_chemist_type_claims
    end)
    (if params[:search]
      all_additional_claims.search(params[:search], star: true)        
    else      
      all_additional_claims.include_associated_classes
      #product.additional_claims.include_associated_classes.paginate_data(params[:page])
    end).paginate(page: params[:page], per_page: 10)
  end

  def as_xls(options = {})
    {
      "SKU" => sku,
      "Name" => name,
      "Price" => price,
      "Ingredients" => ingredients,
      "Application Direction" => application_direction,
    }
  end

  define_index do
    indexes full_name, name, sku, ingredients, price, sortable: true
    has brand_id, product_type_id
    set_property delta: true
  end

  private
  def set_full_name
    self.full_name = "#{self.sku} - #{self.brand_name} - #{self.name} - #{self.product_type_name}"
  end
  
end
