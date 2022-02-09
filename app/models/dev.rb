class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        item = self.freebies.find_by(item_name: item_name)
        item ? true : false
    end

    def give_away(dev, freebies)
        if self.received_one?(freebies) == true
            item = self.freebies.find_by(item_name: freebies)
            item.dev_id = dev.id
        else "Dev did not receive this freebie."
        end
    end
end
