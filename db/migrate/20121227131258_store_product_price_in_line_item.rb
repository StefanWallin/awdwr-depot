class StoreProductPriceInLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :integer, default: 0

    # insert price from product in line each line_item
    LineItem.all.each do |line_item|
      line_item.price = line_item.product.price
      line_item.save!
    end
  end

  def down
    remove_column :line_items, :price
  end
end
