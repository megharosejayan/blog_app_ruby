Summary of latest changes:

- Navigation partial updated to display "(Admin)" for admin user accounts.

- Article actions (edit and delete) made available to admins for all articles in both for articles index (rendering article partial) and articles show views.

- Added ability for admin users to delete other user accounts through the users index page.

 - Embed ruby code in place of hard-coded 'success' in the messages partial. 'success' is returned if the key ('name') from the flash hash is 'notice' and 'danger' is returned otherwise. This gives the alert message the green or red color depending on the notice type.
 
To note:

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


