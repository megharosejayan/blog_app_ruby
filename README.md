Updates so that only admin can create category





 
To note 1:

Delete method directly doesnt word when passed as (method: :delete)

Because the error shows "no get method for /logout" for some reason it wasnt taking the method as delete even though specified, hence checked for get which wasnt there.   
    delete 'logout', to: 'sessions#destroy'

So, create a seperate path in routes.rb(delete and get) for sessions_delete:
    delete 'logout' => 'sessions#destroy', as: 'sessions_delete'
    get 'logout' => 'sessions#destroy'

In the view, write the embedded ruby code:
            <%= link_to 'Logout', sessions_delete_path(), method: :delete,class: "nav-link" %>


For delete article:
in view:
<%= link_to 'Delete Article', articles_delete_url(@article), method: :delete %>
in routes.rb:
 delete 'articles/:id/delete' => 'articles#destroy', as: 'articles_delete'
  get '/articles/:id/delete' => 'articles#destroy'

For some reason, this works well and good.

To note 2:

Error while running rails test that says:

Error:
CategoriesControllerTest#test_should_get_index:
ActionView::Template::Error: Error: File to import not found or unreadable: bootstrap-sprockets.
        on line 1:1 of stdin
 @import "bootstrap-sprockets";

No fix found, but stil works (ie,tests and assertions)


