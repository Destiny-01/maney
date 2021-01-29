class Code < ApplicationRecord
    before_save :check_plan_quota
    # def as_json(options = {})
    #     super(options).merge(id: to_param)
    # end
    include Hashid::Rails
    belongs_to :user
    belongs_to :pro

    private

    def check_code_quota
        if self.codes.count >= 5
            @quota_warning = "code limit reached."
            return false
        end
    end
end
