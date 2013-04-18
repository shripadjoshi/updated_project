class CreateArticleTypes < ActiveRecord::Migration
  def change
    create_table :article_types do |t|
      t.string :name
      t.boolean :delta, default: true, null: false
      t.timestamps
    end
  end
end
