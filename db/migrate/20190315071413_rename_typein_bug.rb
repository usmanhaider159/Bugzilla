class RenameTypeinBug < ActiveRecord::Migration[5.2]
  def change
  	rename_column :bugs, :type , :bugtype
  end
end