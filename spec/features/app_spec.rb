feature "homepage"  do
  scenario "user visits the homepage" do
    visit "/"
    expect(page).to have_content("Welcome to SpiltWhiskey.com")
    expect(page).to have_content("Register Below")
    expect(page).to have_content("Email")
    expect(page).to have_button("Submit")
  end

  scenario "user visits the homepage and registers" do
    visit "/"
    fill_in "Email", with: "gogo@gmail.com"
    click_on "Submit"
    expect(page).to have_content("Thanks for registering gogo@gmail.com")
    expect(page).to have_content("Welcome to SpiltWhiskey.com")
  end



end