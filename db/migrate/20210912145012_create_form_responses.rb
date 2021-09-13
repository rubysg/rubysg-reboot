class CreateFormResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :form_responses do |t|
      t.string :form_type
      t.json :response

      t.timestamps
    end
  end
end
