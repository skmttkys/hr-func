Rails.application.routes.draw do
  resources :posts

  # DBを表示する
  get "test" => "testdbs#index"
  get "posts" => "posts#index"
  get "manual" => "manual#index"

  #localhost:3000が初期画面なので差し替える
  get "/" => "home#index"
  # rails routesでpathを取得できる
  get "top" => "home#top"
  get "about" => "home#about"
  get "item" => "home#item"
  get "home/register" => "home#register"
  get "todo" => "home#todo"
  # 新規作成
  post "posts" => "posts#create"
  # データ編集
  get "posts/:id/edit" => "posts#edit"
  # データ更新
  patch "posts/:id" => "posts#update"
  # データ削除
  delete "posts/:id" => "posts#destroy"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
