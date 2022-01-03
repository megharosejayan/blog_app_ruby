Delete method directly doesnt word when passed as (method: :delete)

Because the error shows "no get method for /logout" for some reason it wasnt taking the method as delete even though specified, hence checked for get which wasnt there.   
    delete 'logout', to: 'sessions#destroy'

So, create a seperate path in routes.rb(delete and get) for sessions_delete:
    delete 'logout' => 'sessions#destroy', as: 'sessions_delete'
    get 'logout' => 'sessions#destroy'

In the view, write the embedded ruby code:
            <%= link_to 'Logout', sessions_delete_path(), method: :delete,class: "nav-link" %>

For some reason, this works well and good.

Summary of changes:

- Added current_user and logged_in? helper methods.

- Modified the navigation partial and utilized these methods to display links based on logged in state.

- Modified the users controller create action so users' are logged in once they sign-up.

- Added set_user method and used it as before_action for show, edit and update actions in users controller.

