class Round < ActiveRecord::Base
  attr_accessible :round_name

  has_many :brands

  validates :round_name, presence: true, uniqueness: {case_sensitive: false}

  def as_xls(options = {})
    {
      "Round" => round_name,
    }
  end

  define_index do
    indexes round_name, sortable: true
    set_property delta: true
  end
end
