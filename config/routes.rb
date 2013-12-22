MyTimeline::Engine.routes.draw do
  match 'github/scrape'      => 'github#scrape', as: "github_scrape"
  post  'github/new'         => 'github#new',    as: "new_github"
  resources :github
end
