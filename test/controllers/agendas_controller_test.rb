require 'test_helper'

class AgendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agenda = agendas(:one)
  end

  test "should get index" do
    get agendas_url, as: :json
    assert_response :success
  end

  test "should create agenda" do
    assert_difference('Agenda.count') do
      post agendas_url, params: { agenda: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show agenda" do
    get agenda_url(@agenda), as: :json
    assert_response :success
  end

  test "should update agenda" do
    patch agenda_url(@agenda), params: { agenda: {  } }, as: :json
    assert_response 200
  end

  test "should destroy agenda" do
    assert_difference('Agenda.count', -1) do
      delete agenda_url(@agenda), as: :json
    end

    assert_response 204
  end
end
