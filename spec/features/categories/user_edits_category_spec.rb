require 'rails_helper'

describe "User edits a Category" do
  scenario "a user can edit a category" do
    category_one = create(:category)
    category_two = create(:category)

    visit edit_category_path(category_one)

    fill_in "category[title]", with: "EA Sports"

    click_button "Update Category"

    expect(current_path).to eq category_path(category_one)
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("#{category_one.title}")

    visit category_path(category_two)

    click_link "Edit"

    expect(current_path).to eq edit_category_path(category_two)
    expect(page).to have_button "Update Category"
  end
end
