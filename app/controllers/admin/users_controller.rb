class Admin::UsersController < Admin::BaseController

  helper_method :sort_column, :sort_direction, :search_params

  before_filter :find_user, :only => [:edit, :update, :show, :destroy]

  def index
    @q = User.search(params[:q])
    search_relation = @q.result
    @users = search_relation.order(sort_column + " " + sort_direction).references(:user).page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit(:email, :firstname, :lastname, :password))
    @user.make_admin if params[:user] && params[:user][:admin]
    if @user.save
      redirect_to admin_users_path, :notice => t(:notice_user_created)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user].permit(:email, :firstname, :lastname))
      redir_path = admin_users_path
      if params[:user] && (params[:user][:admin] == '1')
        @user.make_admin
      else
        if @user.revokable?
          @user.revoke_admin
          redir_path = root_path if current_user == @user
        end
      end
      respond_to do |format|
        format.html {redirect_to redir_path, :notice => t(:notice_user_updated)}
        format.json {render_status_ok}
      end
    else
      respond_to do |format|
        format.html {render :edit}
        format.json {render_json_errors(@user)}
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, :notice => t(:notice_user_deleted)
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "email"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search_params
    { :search => params[:search] }
  end

end
