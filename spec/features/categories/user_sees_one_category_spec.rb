require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category_one = create(:category)
    category_two = create(:category)
    deleted = "Category #{category_one.title} has been deleted"

    visit category_path(category_one)

    expect(current_path).to eq("/categories/#{category_one.id}")
    expect(page).to have_content("#{category_one.title}")
    expect(page).to have_link("Delete")
    expect(page).to have_link("Edit")
    expect(page).to have_link("Categories")
    expect(page).to have_link("Home")

    click_on "Delete"
    expect(current_path).to eq "/categories"
    expect(page).to have_content deleted
    expect(Category.count).to eq 1

    visit category_path(category_two)

    expect(current_path).to eq("/categories/#{category_two.id}")
    expect(page).to have_content("#{category_two.title}")
    expect(page).to have_link("Delete")
    expect(page).to have_link("Edit")
    expect(page).to have_link("Categories")
    expect(page).to have_link("Home")

    click_on "Edit"

    expect(current_path).to eq "/categories/#{category_two.id}/edit"
    expect(page).to have_button "Update Category"
  end
end
