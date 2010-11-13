require 'test_helper'

class RankingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Ranking.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Ranking.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Ranking.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ranking_url(assigns(:ranking))
  end
  
  def test_edit
    get :edit, :id => Ranking.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Ranking.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ranking.first
    assert_template 'edit'
  end

  def test_update_valid
    Ranking.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ranking.first
    assert_redirected_to ranking_url(assigns(:ranking))
  end
  
  def test_destroy
    ranking = Ranking.first
    delete :destroy, :id => ranking
    assert_redirected_to rankings_url
    assert !Ranking.exists?(ranking.id)
  end
end
