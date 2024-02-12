require "test_helper"

class PmdkSchoolListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post auth_login_url, params: {
      email: users(:michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should create pmdk school list' do
    assert_difference 'PmdkSchoolList.count' do
      post pmdk_school_lists_url, params: {
        pmdk_school_list:{
          sekolah: 'SMA Naucipta'
        }
      }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update pmdk school list' do
    patch pmdk_school_list_url(pmdk_school_lists(:one)),
          params: {pmdk_school_list: {
            sekolah: 'SMK Agung' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    pmdk_school_lists(:one).reload
    assert_equal 'SMK Agung', pmdk_school_lists(:one).sekolah
  end

  test 'should show province list' do
    get pmdk_school_list_url(pmdk_school_lists(:one)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end
end
