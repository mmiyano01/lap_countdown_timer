module AddInitializeCallback
  extend ActiveModel::Callbacks
  def initialize(params={})
    run_callbacks :initialize do
      super
    end
  end
end