require 'test_helper'

class MixesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mix = mixes(:one)
  end

  test "should get index" do
    get mixes_url
    assert_response :success
  end

  test "should get new" do
    get new_mix_url
    assert_response :success
  end

  test "should create mix" do
    assert_difference('Mix.count') do
      post mixes_url, params: { mix: { description: @mix.description, title: @mix.title } }
    end

    assert_redirected_to mix_url(Mix.last)
  end

  test "should show mix" do
    get mix_url(@mix)
    assert_response :success
  end

  test "should get edit" do
    get edit_mix_url(@mix)
    assert_response :success
  end

  test "should update mix" do
    patch mix_url(@mix), params: { mix: { description: @mix.description, title: @mix.title } }
    assert_redirected_to mix_url(@mix)
  end

  test "should destroy mix" do
    assert_difference('Mix.count', -1) do
      delete mix_url(@mix)
    end

    assert_redirected_to mixes_url
  end
end
