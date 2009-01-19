module RepositoriesHelper
  def new_repo_link
    content_for :admin_tab do
      content_tag :li, link_to('New Repository', new_repository_path), :id => 'new-repo'
    end if admin?
    nil
  end
end
