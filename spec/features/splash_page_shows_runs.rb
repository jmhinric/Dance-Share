require 'spec_helper'

describe "splash page shows runs" do
  let!(:run1) { FactoryGirl.create(:recent_week_run) }
  let!(:run2) { FactoryGirl.create(:recent_month_run) }
  let!(:run3) { FactoryGirl.create(:upcoming_week_run) }
  let!(:run4) { FactoryGirl.create(:upcoming_month_run) }

  it "displays performances from the last week" do
    
    visit root_path
    within "#home-recent" do
      expect(page).to have_content "Recent"
    
      within "div.home-show-info" do
        expect(page).to have_content run1.company.name
        expect(page).to have_content run1.venue.name
        expect(page).to have_content run1.performances.order(:date).first.date.strftime("%A, %B %e, %Y")
        expect(page).to have_content run1.performances.order(:date).last.date.strftime("%A, %B %e, %Y")
      end
    end
  end

  it "does not display performances older than last week" do
    
    visit root_path
    within "#home-recent" do
      expect(page).to have_content "Recent"
    
      # within "div.home-show-info" do
        expect(page).to_not have_content run2.company.name
        expect(page).to_not have_content run2.venue.name
        expect(page).to_not have_content run2.performances.order(:date).first.date.strftime("%A, %B %e, %Y")
        expect(page).to_not have_content run2.performances.order(:date).last.date.strftime("%A, %B %e, %Y")
      # end
    end
  end

  it "displays performances for the upcoming week" do
    
    visit root_path
    within "#home-upcoming" do
      expect(page).to have_content "Upcoming"
    
      within "div.home-show-info" do
        expect(page).to have_content run3.company.name
        expect(page).to have_content run3.venue.name
        expect(page).to have_content run3.performances.order(:date).first.date.strftime("%A, %B %e, %Y")
        expect(page).to have_content run3.performances.order(:date).last.date.strftime("%A, %B %e, %Y")
      end
    end
  end

  it "does not display performances beyond the upcoming week" do
    
    visit root_path
    within "#home-upcoming" do
      expect(page).to have_content "Upcoming"
    
      # within "div.home-show-info" do
        expect(page).to_not have_content run4.company.name
        expect(page).to_not have_content run4.venue.name
        expect(page).to_not have_content run4.performances.order(:date).first.date.strftime("%A, %B %e, %Y")
        expect(page).to_not have_content run4.performances.order(:date).last.date.strftime("%A, %B %e, %Y")
      # end
    end
  end

  it "displays performances that are mid-run" do

    

  end
end