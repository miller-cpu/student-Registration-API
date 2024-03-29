require "test_helper"

class PersonalGenderListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all personal gender list' do
    get api_v1_personal_gender_lists_url, as: :json
    assert_response :success
  end

  test 'should create personal gender list' do
    assert_difference 'PersonalGenderList.count' do
      post api_v1_personal_gender_lists_url, params: {
        personal_gender_list:{
          jenis_kelamin: 'Pria'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update personal gender list' do
    patch api_v1_personal_gender_list_url(personal_gender_lists(:one)),
          params: {personal_gender_list: {
            jenis_kelamin: 'Wanita' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    personal_gender_lists(:one).reload
    assert_equal 'Wanita', personal_gender_lists(:one).jenis_kelamin
  end

  test 'should show personal gender list' do
    get api_v1_personal_gender_list_url(personal_gender_lists(:one)),
         headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy personal gender list' do
    assert_difference 'PersonalGenderList.count', -1 do
      delete api_v1_personal_gender_list_url(personal_gender_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
      assert_response :success
    end
  end
end
