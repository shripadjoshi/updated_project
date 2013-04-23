class Review < ActiveRecord::Base
  attr_accessible :reviewable_id, :reviewable_type,:user_id, :type_of_ingredient_id, :contact_time, :ingredient_source,
    :chemical_components, :pharmacodynamics, :summary, :article_type_id, :main_link,
    :database_searched, :key_word, :citation_searched, :peer_reviewed, :type_of_study_id,
    :evidence, :main_article_summary, :ingredient_class_id, :additional_chemical_info, :allergic,
    :other_concerns, :last_updated_by


  belongs_to :reviewable, polymorphic: true, touch: true
  
  belongs_to :user
  delegate :name, to: :user, allow_nil: true, prefix: true

  belongs_to :type_of_ingredient
  delegate :name, to: :type_of_ingredient, allow_nil: true, prefix: true

  belongs_to :article_type
  delegate :name, to: :type_of_ingredient, allow_nil: true, prefix: true

  belongs_to :type_of_study
  delegate :name, to: :type_of_study, allow_nil: true, prefix: true

  belongs_to :ingredient_class
  delegate :class_name, to: :ingredient_class, allow_nil: true, prefix: true

  belongs_to :who_updated, class_name: "User", foreign_key: "last_updated_by"
  delegate :name, to: :who_updated, allow_nil: true, prefix: true
end