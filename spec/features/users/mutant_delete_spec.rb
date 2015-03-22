include Warden::Test::Helpers
Warden.test_mode!

# Feature: Mutant delete
#   As a mutant
#   I want to delete my mutant profile
#   So I can close my account
feature 'Mutant delete', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Mutant can delete own account
  #   Given I am signed in
  #   When I delete my account
  #   Then I should see an account deleted message
  scenario 'mutant can delete own account' do
    skip 'skip a slow test'
    mutant = FactoryGirl.create(:mutant)
    login_as(mutant, :scope => :mutant)
    visit edit_mutant_registration_path(mutant)
    click_button 'Cancel my account'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content I18n.t 'devise.registrations.destroyed'
  end

end




