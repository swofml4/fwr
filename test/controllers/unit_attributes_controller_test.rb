require 'test_helper'

class UnitAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_attribute = unit_attributes(:one)
  end

  test "should get index" do
    get unit_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_attribute_url
    assert_response :success
  end

  test "should create unit_attribute" do
    assert_difference('UnitAttribute.count') do
      post unit_attributes_url, params: { unit_attribute: { description: @unit_attribute.description, name: @unit_attribute.name } }
    end

    assert_redirected_to unit_attribute_url(UnitAttribute.last)
  end

  test "should show unit_attribute" do
    get unit_attribute_url(@unit_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_attribute_url(@unit_attribute)
    assert_response :success
  end

  test "should update unit_attribute" do
    patch unit_attribute_url(@unit_attribute), params: { unit_attribute: { description: @unit_attribute.description, name: @unit_attribute.name } }
    assert_redirected_to unit_attribute_url(@unit_attribute)
  end

  test "should destroy unit_attribute" do
    assert_difference('UnitAttribute.count', -1) do
      delete unit_attribute_url(@unit_attribute)
    end

    assert_redirected_to unit_attributes_url
  end
end
