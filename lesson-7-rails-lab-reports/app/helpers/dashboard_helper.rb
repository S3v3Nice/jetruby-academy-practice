module DashboardHelper
  def menu_items
    [
      { name: "Lab Reports", icon: "fa-solid fa-file-signature", url: lab_reports_path },
      { name: "Users", icon: "fa-solid fa-user", url: users_path }
    ]
  end
end
