require 'rails_helper'

feature 'user submits question', %(
  As a user
  be able to submit a question

  Acceptance Criteria
  - [x] I must provide a title that is at least 40 characters long
  - [x] I must provide a description that is at least 150 characters long
  - [x] I must be presented with errors if I fill out the form incorrectly
) do

  scenario 'submit a question' do

    visit root_path
    click_link "submit new question"
    expect(page).to have_content("Add new question below")
    fill_in 'question[title]', with: "so many charactors, question is why so many?so many charactors, question is why so many?so many charactors, question is why so many?"
    fill_in 'question[description]', with: "these are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important detailsthese are very important details"
    click_button "Save Question"
    expect(page).to have_content("so many charactors, question is why so many?so many charactors, question is why so many?so many charactors, question is why so many?")
  end
end
