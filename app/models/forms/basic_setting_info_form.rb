class BasicSettingInfoForm
  include ActiveModel::Model
  include AddAttributes
  include
  define_model_callbacks :initialize, :only => [:after, :before]

  attr_accessor :duration , :interval, :notif_time

end