class CreateAdminService
  def call
    mutant = Mutant.find_or_create_by!(email: Rails.application.secrets.admin_email) do |mutant|
        mutant.password = Rails.application.secrets.admin_password
        mutant.password_confirmation = Rails.application.secrets.admin_password
        mutant.confirm!
        mutant.name = Rails.application.secrets.admin_name
      end
  end
end
