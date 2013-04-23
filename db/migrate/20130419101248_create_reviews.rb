class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true
      t.integer :user_id
      t.integer :type_of_ingredient_id
      t.time :contact_time
      t.text :ingredient_source
      t.text :chemical_components
      t.text :pharmacodynamics
      t.text :summary
      t.integer :article_type_id
      t.text :main_link
      t.text :database_searched
      t.string :key_word
      t.text :citation_searched
      t.boolean :peer_reviewed
      t.integer :type_of_study_id
      t.text :evidence
      t.text :main_article_summary
      t.integer :ingredient_class_id
      t.text :additional_chemical_info
      t.text :allergic
      t.text :other_concerns
      t.integer :last_updated_by
      t.boolean :delta
      t.timestamps
    end
  end
end


#Review(
#  delta: boolean, study_id: integer, deleted_at: datetime, deleted_by: string)