class CreateApiJavascripts < ActiveRecord::Migration
  def change
    create_table :api_javascripts do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
