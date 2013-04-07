class Ingredient < ActiveRecord::Base
  attr_accessible :avatar1, :avatar2, :avatar3, :ingredient, :ingredient_definition, :latin_name
  mount_uploader :avatar1, ImageUploader
  mount_uploader :avatar2, ImageUploader
  mount_uploader :avatar3, ImageUploader

  validates :ingredient, presence: true, uniqueness: {case_sensitive: false}

  def as_xls(options = {})
    {
      "Ingredient" => ingredient,
      "Latin Name" => latin_name,
      "Ingredient Definition" => ingredient_definition
    }
  end

  def images?
    return (self.avatar1? || self.avatar2? || self.avatar3?)
  end

  def remove_image(avatar)
    eval("self.remove_avatar#{avatar} = true")
  end

  define_index do
    indexes ingredient, sortable: true
    indexes latin_name, sortable: true
    indexes ingredient_definition, sortable: true
    set_property delta: true
  end
end
