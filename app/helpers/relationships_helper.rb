module RelationshipsHelper
    
    
    def offered?
        if logged_in?
            current_user.offering?(partner)
        end
    end
    
    def received?
        if logged_in?
            current_user.receiving?(proposer)
        end
    end
 
    def accepted?
        if logged_in? && current_user.relationships.first.status == "承諾"
            return true
        else
            return false
        end
    end
        
    def being_accepted?
        
        if logged_in? && proposer.relationships.first.status == "承諾"
            return true
        else
            return false
        end
    end

end