module Admin::Artists::TatsHelper



def approve_tat
@tat.status.update
end

end
