require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(name: "John", email: "john@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "name should be present" do
    @chef.name = " "
    assert_not @chef.valid?
  end
  
  test "name should not be too long" do
      @chef.name = "a" * 51
    assert_not @chef.valid?
  end
  
  test "name should not be too short" do
     @chef.name = "a"
    assert_not @chef.valid?
  end
  
  test "email should be present" do
      @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email should be within bounds" do
    @chef.email = "a" * 101 + "example.com"
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@example.com laura+joe@monk.com]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation reject invalid" do
    invalid_addresses = %w[user@example,com user_et_ee.org user.nam@example ee@i_i_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{va.inspect} should be invalid'
    end
  end
  
end
