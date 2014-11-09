module Admin::UsersHelper
  def destroy_classes
    c = ['btn', 'btn-danger', 'btn-xs']
    c << 'hidden' unless @user.deletable?
    c
  end
end
