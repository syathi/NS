Rails.application.routes.draw do

  #get "パス" => "コントローラ名#アクション名", :as "パスを返すメソッド名にする"
  get "stafftop" => "top#stafftop", as: "stafftop"
  get 'admin_top/index', as: "admin_top"  #管理者トップページ(消すかもしれない)
  get 'admin_login' => "top#admin_login", as: "admin_login" #管理者用ログインページ
  get 'staff_login' => "top#staff_login", as: "staff_login" #スタッフ用ログインページ
  get 'login' => "top#login", as: "login" #ユーザ用ログインページ(必要なければ削除)
  
  # resources :リソース名の複数形 do 
  # 	collection { HTTPメソッド アクション名} #集合
  # 	member { HTTPメソッド アクション名} #個別のリソース

  resource :admin do
  	member { get "edit_pass"} #管理者パスワード変更
  	member { get "edit_pass_staff"} #スタッフパスワード変更
    member { get "staff_update"}
  	member { get "secret_ques"} #管理者用秘密の質問ページ
    member { get "secret_ques_check"} #管理者用秘密の質問照合用アクション
  end
  resource :staff, only: [:edit, :update]
  resource :admin_sessions, only: [:create, :destroy]
  resource :staff_session, only: [:create, :destroy]

  resources :users do
  	member{ get "freeze"} #アカウント凍結
  end
  resource :session, only: [:create, :destroy, :edit]

  resources :clothes do
  	member { get "recommend" } #お勧めボタン
  end
  resources :reservations do
  	collection { get "delay" }# 延滞商品一覧
  	collection { get "unsend"}# 未発送商品一覧
  	collection { get "unreturn"}# 未返却商品一覧
  	member { get "forword"} #発送ボタン
  	member { get "to_return"} #返却ボタン
  	member { delete "cansel"}# 予約キャンセル
  end

  root 'top#index' 
 
end


