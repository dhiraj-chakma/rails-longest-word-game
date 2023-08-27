Rails.application.routes.draw do
  root to: "games#new"
  get "score", to: "games#score"
end
