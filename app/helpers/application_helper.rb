module ApplicationHelper

    def current_user
        User.find(session[:user_id]) unless session[:user_id].nil?
    end

    def logged?
        session[:user_id].present?
    end
end
