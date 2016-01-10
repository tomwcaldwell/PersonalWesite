class AddAdminIdToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :admin_id, :integer
    add_index :blogs, :admin_id
  end
end
