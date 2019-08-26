class AdminsBackoffice::WelcomeController < AdminsBackofficeController

  # route: /admins_backoffice/welcome/index => method: GET
  def index
    @total_questions = AdminStatistic.total_questions
    @total_users = AdminStatistic.total_users
  end
end
