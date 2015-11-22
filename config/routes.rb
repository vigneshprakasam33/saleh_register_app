Rails.application.routes.draw do
 
    match "registers/login",     :to => "registers#login",       :via => [:get, :post]
    #customized url format
    #match "registers/sign_out",    :to => "registers#logout",      :via => [:get]
    get 'registers/logout'
    match "registers/welcome",   :to => "registers#welcome",     :via => [:get,:post]
    match "registers/question",  :to => "registers#question",    :via => [:get,:post]
    match "registers/picture",   :to => "registers#picture",     :via => [:get]
    match "registers/signup",  :to => "registers#signup",    :via => [:get, :post]

    post 'registers/submit_question'


    root 'registers#login'

end