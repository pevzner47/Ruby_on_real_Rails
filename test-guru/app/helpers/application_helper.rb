module ApplicationHelper

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def show_flash(type)
    if flash[type]
      render 'shared/flash_massage', type: type
    end
  end
end
