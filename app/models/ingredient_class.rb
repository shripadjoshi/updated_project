class IngredientClass < ActiveRecord::Base
  attr_accessible :avatar1, :avatar2, :avatar3, :class_definition, :class_name
  mount_uploader :avatar1, ImageUploader
  mount_uploader :avatar2, ImageUploader
  mount_uploader :avatar3, ImageUploader

  has_many :reviews, dependent: :destroy
  validates :class_name, presence: true, uniqueness: {case_sensitive: false}

  def as_xls(options = {})
    {
      "Ingredient Class" => class_name,
      "Ingredient Class Definition" => class_definition
    }
  end

  def images?
    return (self.avatar1? || self.avatar2? || self.avatar3?)
  end

  def remove_image(avatar)
    eval("self.remove_avatar#{avatar} = true")
  end

  define_index do
    indexes class_name, sortable: true
    indexes class_definition, sortable: true
    set_property delta: true
  end

end
