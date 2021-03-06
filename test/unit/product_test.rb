require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    fixtures :products
    test "product attributes must not be empty" do
        product = Product.new
        assert product.invalid?
        assert product.errors[:title].any?
        assert product.errors[:description].any?
        assert product.errors[:price].any?
        assert product.errors[:image_url].any?
    end

    test "product price must be positive" do
        product = Product.new(
            title: "My techie gadget",
            description: "lorem ipsum dolor blaha blaha",
            image_url: "http://lorempixel.com/g/80/60/"
        )

        product.price = -1
        assert product.invalid?
        assert_equal "must be greater than or equal to 0.01", 
            product.errors[:price].join('; ')

        product.price = 0
        assert product.invalid?
        assert_equal "must be greater than or equal to 0.01", 
            product.errors[:price].join('; ')

        product.price = 0.001
        assert product.invalid?
        assert_equal "must be greater than or equal to 0.01", 
            product.errors[:price].join('; ')

        product.price = 1
        assert product.valid?

        product.price = 0.2
        assert product.valid?
    end
    def new_product(image_url)
        Product.new(
            title: "My book Title",
            description: "yyy",
            price: 1,
            image_url: image_url
        )
    end

    test "image url" do
        ok = %w{ fred.gif fred.jpg fred.png FRED.jpG FeRD.jPg http://lorempixel.com/g/80/60/ }
        bad = %w{ fred.doc fred.gif/more fred.gif.more }
        ok.each do |name|
            assert new_product(name).valid?, "#{name} shouldn't be invalid"
        end

        bad.each do |name|
            assert new_product(name).invalid?, "#{name} shouldn't be valid"
        end
    end

    test "product is not valid without a unique title" do
        product = Product.new(
            title: products(:ruby).title,
            description: 'yyy',
            price: 1,
            image_url: "https://docs.google.com/a/blocket.se/spreadsheet/ccc?key=0Ag3GLRS3hpTbdGt0YVBNYUY4MEVOUFhWbWxDNV84NFE"

        )

        assert !product.save
        assert_equal "has already been taken", product.errors[:title].join('; ')
    end

    test "product is not valid without a unique title - i18n" do
        product = Product.new(
            title: products(:ruby).title,
            description: 'yyy',
            price: 1,
            image_url: "https://docs.google.com/a/blocket.se/spreadsheet/ccc?key=0Ag3GLRS3hpTbdGt0YVBNYUY4MEVOUFhWbWxDNV84NFE"

        )

        assert !product.save
        assert_equal I18n.translate('activerecord.errors.messages.taken'), product.errors[:title].join('; ')
    end

    test "product title has be at least 10 characters long" do
        product = Product.new(
            title: products(:short_title).title,
            description: products(:short_title).description,
            price: products(:short_title).price,
            image_url: products(:short_title).image_url
        )
        assert !product.save
        assert_equal I18n.translate('activerecord.errors.messages.taken')+ "; "+ I18n.translate('errors.messages.too_short',count: 10), product.errors[:title].join('; ')
        product.title+="extra things in title"
        assert product.save
    end
end
