class AddUuidToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :uuid, :string
  end
end
