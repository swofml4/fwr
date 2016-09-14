require 'test_helper'

class UnitAttributeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_attribute_type = unit_attribute_types(:one)
  end

  test "should get index" do
    get unit_attribute_types_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_attribute_type_url
    assert_response :success
  end

  test "should create unit_attribute_type" do
    assert_difference('UnitAttributeType.count') do
      post unit_attribute_types_url, params: { unit_attribute_type: { adjustment: @unit_attribute_type.adjustment, name: @unit_attribute_type.name, negated_by_unit_attribute_type_id: @unit_attribute_type.negated_by_unit_attribute_type_id, rule: @unit_attribute_type.rule } }
    end

    assert_redirected_to unit_attribute_type_url(UnitAttributeType.last)
  end

  test "should show unit_attribute_type" do
    get unit_attribute_type_url(@unit_attribute_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_attribute_type_url(@unit_attribute_type)
    assert_response :success
  end

  test "should update unit_attribute_type" do
    patch unit_attribute_type_url(@unit_attribute_type), params: { unit_attribute_type: { adjustment: @unit_attribute_type.adjustment, name: @unit_attribute_type.name, negated_by_unit_attribute_type_id: @unit_attribute_type.negated_by_unit_attribute_type_id, rule: @unit_attribute_type.rule } }
    assert_redirected_to unit_attribute_type_url(@unit_attribute_type)
  end

  test "should destroy unit_attribute_type" do
    assert_difference('UnitAttributeType.count', -1) do
      delete unit_attribute_type_url(@unit_attribute_type)
    end

    assert_redirected_to unit_attribute_types_url
  end
end
