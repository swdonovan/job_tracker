require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path

    fill_in "category[title]", with: "Homer"

    click_button "Create Category"

    expect(current_path).to eq category_path(Category.last)
    expect(page).to have_content("Homer")
    expect(page).to have_content("Delete")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Categories")
    expect(page).to have_link("Home")

    visit categories_path

    click_on ("New Category")

    expect(current_path).to eq new_category_path

    fill_in "category[title]", with: "Homer"

    click_on "Create Category"

    expect(page).to have_content("error")
    expect(page).to have_content("Title has already been taken")
    expect(page).to have_button("Create Category")
  end
end
