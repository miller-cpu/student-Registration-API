require "test_helper"

class AchievementTingkatListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all achievement tingkat' do
    get api_v1_achievement_tingkat_lists_url, as: :json
    assert_response :success
  end

  test 'should create achievement tingkat' do
    assert_difference('AchievementTingkatList.count') do
      post api_v1_achievement_tingkat_lists_url, params: {
        achievement_tingkat_list: { tingkat: 'kecamatan' }
      }, headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    end
    assert_response :success
  end

  test 'should update achievement tingkat' do
    patch api_v1_achievement_tingkat_list_url(achievement_tingkat_lists(:one)),
          params: {
            achievement_tingkat_list: { tingkat: 'provinsi' }
          }, headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    assert_response :success
    assert_equal 'provinsi',
                 achievement_tingkat_lists(:one).reload.tingkat
  end

  test 'should show achievement tingkat' do
    get api_v1_achievement_tingkat_list_url(achievement_tingkat_lists(:one)),
        headers: {'Authorization' => "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test 'should delete achievement tingkat' do
    assert_difference 'AchievementTingkatList.count', -1 do
      delete api_v1_achievement_tingkat_list_url(achievement_tingkat_lists(:one)),
             headers: {'Authorization' => "Bearer #{@token}" }, as: :json
      assert_response :success
    end
  end
end
