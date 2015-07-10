package yourBook

class SecurityFilters {

    def filters = {
        doLogin(controller: '*', action: '*') {
            before = {
                if (!controllerName) {
                    return true
                }
                def allowedActions = ['login','logout','authenticate']
                if(!session.user && !allowedActions.contains(actionName))
                        {
                            redirect(controller: 'user', action: 'login')

                            return false
                        }

            }
/*
                after = { model->
                }
            afterView = {
            }
*/
        }
    }
}