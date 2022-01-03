Delete method directly doesnt word when passed as (method: :delete)

Because the error shows "no get method for /logout" for some reason it wasnt taking the method as delete even though specified, hence checked for get which wasnt there.   
    delete 'logout', to: 'sessions#destroy'

So, create a seperate path in routes.rb(delete and get) for sessions_delete:
    delete 'logout' => 'sessions#destroy', as: 'sessions_delete'
    get 'logout' => 'sessions#destroy'

In the view, write the embedded ruby code:
            <%= link_to 'Logout', sessions_delete_path(), method: :delete,class: "nav-link" %>

For some reason, this works well and good.

