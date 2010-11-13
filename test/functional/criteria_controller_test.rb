require 'test_helper'

class CriteriaControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Criterion.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Criterion.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Criterion.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to criterion_url(assigns(:criterion))
  end
  
  def test_edit
    get :edit, :id => Criterion.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Criterion.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Criterion.first
    assert_template 'edit'
  end

  def test_update_valid
    Criterion.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Criterion.first
    assert_redirected_to criterion_url(assigns(:criterion))
  end
  
  def test_destroy
    criterion = Criterion.first
    delete :destroy, :id => criterion
    assert_redirected_to criteria_url
    assert !Criterion.exists?(criterion.id)
  end
end
