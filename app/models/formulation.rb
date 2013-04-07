class Formulation < ActiveRecord::Base
  attr_accessible :formulation_name

  validates :formulation_name, presence: true, uniqueness: {case_sensitive: false}

  def as_xls(options = {}){
      "Formulation" => formulation_name,
    }
  end

  define_index do
    indexes formulation_name, sortable: true
    set_property delta: true
  end
end
