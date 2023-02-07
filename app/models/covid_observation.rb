class CovidObservation < ApplicationRecord

    # exclude unwanted columns
    def as_json(options = {})
        super(options.merge({ except: [:id] }))
      end
end
