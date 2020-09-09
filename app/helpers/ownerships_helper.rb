module OwnershipsHelper

    def ownerships_list(user)
      ownerships = Ownership.where(user_id: user.id)
      render :json => ownerships
    end
    
  end