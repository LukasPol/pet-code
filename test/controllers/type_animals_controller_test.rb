require 'test_helper'

class TypeAnimalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_animal = type_animals(:one)
  end

  test "should get index" do
    get type_animals_url, as: :json
    assert_response :success
  end

  test "should create type_animal" do
    assert_difference('TypeAnimal.count') do
      post type_animals_url, params: { type_animal: { name: @type_animal.name } }, as: :json
    end

    assert_response 201
  end

  test "should show type_animal" do
    get type_animal_url(@type_animal), as: :json
    assert_response :success
  end

  test "should update type_animal" do
    patch type_animal_url(@type_animal), params: { type_animal: { name: @type_animal.name } }, as: :json
    assert_response 200
  end

  test "should destroy type_animal" do
    assert_difference('TypeAnimal.count', -1) do
      delete type_animal_url(@type_animal), as: :json
    end

    assert_response 204
  end
end
