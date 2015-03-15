include Warden::Test::Helpers
Warden.test_mode!

# Feature: Mutant edit
#   As a mutant
#   I want to edit my mutant profile
#   So I can change my email address
feature 'Mutant edit', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Mutant changes email address
  #   Given I am signed in
  #   When I change my email address
  #   Then I see an account updated message
  scenario 'mutant changes email address' do
    mutant = FactoryGirl.create(:mutant)
    login_as(mutant, :scope => :mutant)
    visit edit_mutant_registration_path(mutant)
    fill_in 'Email', :with => 'newemail@example.com'
    fill_in 'Current password', :with => mutant.password
    click_button 'Update'
    txts = [I18n.t( 'devise.registrations.updated'), I18n.t( 'devise.registrations.update_needs_confirmation')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  # Scenario: Mutant cannot edit another mutant's profile
  #   Given I am signed in
  #   When I try to edit another mutant's profile
  #   Then I see my own 'edit profile' page
  scenario "mutant cannot cannot edit another mutant's profile", :me do
    me = FactoryGirl.create(:mutant)
    other = FactoryGirl.create(:mutant, email: 'other@example.com')
    login_as(me, :scope => :mutant)
    visit edit_mutant_registration_path(other)
    expect(page).to have_content 'Edit Mutant'
    expect(page).to have_field('Email', with: me.email)
  end

end
