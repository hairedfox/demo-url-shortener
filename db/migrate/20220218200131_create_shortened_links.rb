class CreateShortenedLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_links, id: false do |t|
      t.string :url
      t.string :uid, primary_key: true

      t.timestamps
    end
  end
end
