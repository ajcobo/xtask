# Feature: Sign in
#   As a mutant
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do

  # Scenario: mutant cannot sign in if not registered
  #   Given I do not exist as a mutant
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  scenario 'mutant cannot sign in if not registered' do
    signin('test@example.com', 'please123')
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  end

  # Scenario: mutant can sign in with valid credentials
  #   Given I exist as a mutant
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  scenario 'mutant can sign in with valid credentials' do
    mutant = FactoryGirl.create(:mutant)
    signin(mutant.email, mutant.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  # Scenario: mutant cannot sign in with wrong email
  #   Given I exist as a mutant
  #   And I am not signed in
  #   When I sign in with a wrong email
  #   Then I see an invalid email message
  scenario 'mutant cannot sign in with wrong email' do
    mutant = FactoryGirl.create(:mutant)
    signin('invalid@email.com', mutant.password)
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  end

  # Scenario: mutant cannot sign in with wrong password
  #   Given I exist as a mutant
  #   And I am not signed in
  #   When I sign in with a wrong password
  #   Then I see an invalid password message
  scenario 'mutant cannot sign in with wrong password' do
    mutant = FactoryGirl.create(:mutant)
    signin(mutant.email, 'invalidpass')
    expect(page).to have_content I18n.t 'devise.failure.invalid', authentication_keys: 'email'
  end

end
