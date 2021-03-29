class AddPrivateToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :private, :bool
  end
end
