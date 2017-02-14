<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> b1034e2f1de40d3562ded660e73fb6ddaba81024
class ReposController < ApplicationController

  def show
    session[:repo_id] = params[:id]
    redirect_to home_path
  end

  def create
    current_user.repos.create(repo_params)
    current_repo.repos << repo if current_repo
    redirect_to home_index_path
  end
  
  private

    def repo_params
      params.require(:repo).permit(:aws_url)
    end

<<<<<<< HEAD
end
>>>>>>> e4a03a972731588da27f7cc027370b45f2a2efbe
=======
end
>>>>>>> b1034e2f1de40d3562ded660e73fb6ddaba81024
