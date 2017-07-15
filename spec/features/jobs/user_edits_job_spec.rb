# require 'rails_helper'
#
# describe "User edits a job from the library" do
#   scenario "a user clicks edit for a job" do
#     job = create(:job)
#
#     visit company_job_path(job[:company_id], job)
#
#     click_on "Edit"
#     fill_in "job_title", with: "Engineer"
#     fill_in "job_description", with: "Smart things"
#     fill_in "job_city", with: "Dallas"
#
#     click_on "Update Job"
#
#     expect(current_path).to eq company_jobs_path(job)
#     expect(page).to have_content "Engineer"
#     expect(page).to have_content "Smart things"
#     expect(page).to have_content "Dallas"
#     expect(page).to_not have_content job[:city]
#     expect(page).to_not have_content job[:title]
#     expect(page).to_not have_content job[:job_description]
#     expect(page).to_not have_content job[:job_city]
#   end
# end
