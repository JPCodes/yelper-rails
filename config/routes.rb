Rails.application.routes.draw do

  resource :messages do
    collection do
      post 'reply'
    end
  end

end
