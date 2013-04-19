class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true
      t.integer :user_id
      t.integer :ingredient_type_id
      t.time :contact_time
      t.text :ingredient_source
      t.text :chemical_components
      t.text :pharmacodynamics
      t.text :summary
      t.integer :article_type_id
      
      t.timestamps
    end
  end
end


#Review(

#  main_link: text, database_searched: text, key_word: string, citation_searched: text,
#  peer_reviewed: boolean, type_of_study: string, evidence: text, main_article_summary: text,
#  related_articles: text, review_name: string, ingredient_class: string, article_type: string,
#  additional_chemical_info: text, allergic: text, other_concerns: text, ancestry: string,
#  last_updated_by: integer,
#  delta: boolean, study_id: integer, deleted_at: datetime, deleted_by: string)