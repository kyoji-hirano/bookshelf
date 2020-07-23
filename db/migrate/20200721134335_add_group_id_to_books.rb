class AddGroupIdToBooks < ActiveRecord::Migration[5.2]
  def up
    add_reference :books, :group, null: false, index: true
  end

  def down
    remove_reference :books, :group, index: true 
  end
end
