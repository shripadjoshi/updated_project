class SkinHairType < ActiveRecord::Base
  attr_accessible :skin_hair_type

  validates :skin_hair_type, presence: true, uniqueness: {case_sensitive: false}

  def as_xls(options = {})
    {
      "Skin/Hair Type" => skin_hair_type,
    }
  end

  define_index do
    indexes skin_hair_type, sortable: true
    set_property delta: true
  end
end
