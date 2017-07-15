require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_one = create(:category)
    category_two = create(:category)

    visit categories_path

    expect(page).to have_content("Categories")
    expect(page).to have_content("#{category_one.title}")
    expect(page).to have_content("#{category_two.title}")
    expect(page).to have_link("Edit #{category_one.title}")
    expect(page).to have_link("Edit #{category_two.title}")
    expect(page).to have_link("Delete #{category_two.title}")
    expect(page).to have_link("Delete #{category_one.title}")
    expect(page).to have_link("New Category")

    click_on("New Category")

    expect(current_path).to eq new_category_path

    visit categories_path

    click_on("Edit #{category_one.title}")

    expect(current_path).to eq edit_category_path(category_one)

    visit categories_path

    click_on("#{category_two.title}")

    expect(current_path).to eq category_path(category_two)

    visit categories_path

    click_on("Delete #{category_one.title}")

    expect(current_path).to eq categories_path
    expect(page).to have_content "#{category_two.title}"
    expect(Category.count).to eq 1
  end

end
