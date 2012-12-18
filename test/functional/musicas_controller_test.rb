require 'test_helper'

class MusicasControllerTest < ActionController::TestCase
  setup do
    @musica = musicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:musicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create musica" do
    assert_difference('Musica.count') do
      post :create, musica: { autor: @musica.autor, nome: @musica.nome }
    end

    assert_redirected_to musica_path(assigns(:musica))
  end

  test "should show musica" do
    get :show, id: @musica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @musica
    assert_response :success
  end

  test "should update musica" do
    put :update, id: @musica, musica: { autor: @musica.autor, nome: @musica.nome }
    assert_redirected_to musica_path(assigns(:musica))
  end

  test "should destroy musica" do
    assert_difference('Musica.count', -1) do
      delete :destroy, id: @musica
    end

    assert_redirected_to musicas_path
  end
end
