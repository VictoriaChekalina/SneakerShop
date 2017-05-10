class AddLogosToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :logos, :string
  end
end
