class ChangeImageFileNameToImageUrlFileNameInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :image_file_name, :image_url_file_name
  end
end
