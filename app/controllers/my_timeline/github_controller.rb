module MyTimeline
  class GithubController < ApplicationController
    def new
      @user.settings(:github).user_name = params[:user_name]
      @user.save!
      redirect_to control_panel_path, notice: "Github added!"
    end

    def scrape
      scrapey = MyTimeline::Github::GithubScraper.new(@user).scrape
      redirect_to :back, notice: "Added #{scrapey} gits."
    end
  end
end
