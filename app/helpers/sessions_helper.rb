module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def partner
        if logged_in?
            @partner = current_user.offerings.first || current_user.receivings.first
        end
    end

    def proposer
        if logged_in?
            @proposer = current_user.receivings.first
        end
    end
    
    def logged_in?
        !!current_user
    end
    
end
