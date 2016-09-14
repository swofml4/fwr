require 'test_helper'

class SimulationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get simulation_index_url
    assert_response :success
  end

  test "should get dice_roll" do
    get simulation_dice_roll_url
    assert_response :success
  end

end
