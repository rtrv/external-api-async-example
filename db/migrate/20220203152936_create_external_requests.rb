class CreateExternalRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :external_requests do |t|
      t.string :state, default: :created
      t.string :request_type
      t.string :payload
      t.references :car

      t.timestamps
    end
  end
end
