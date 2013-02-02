require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add unique products to cart" do
    cart = Cart.create
    book_one = products(:ruby)
    book_two = products(:pragprog)
    cart.add_product(book_one.id).save!
    cart.add_product(book_two.id).save!
    assert_equal 2, cart.line_items.size
    assert_equal book_one.price + book_two.price, cart.total_price
  end

  test "add_duplicate_product" do
    cart = Cart.create
    ruby_book = products(:ruby)
    cart.add_product(ruby_book.id).save!
    cart.add_product(ruby_book.id).save!
    assert_equal 2*ruby_book.price, cart.total_price
    assert_equal 1, cart.line_items.size
    assert_equal 2, cart.line_items[0].quantity
  end 

end
