class UnlimitedLapController < ApplicationController
  before_action :form_factory

  def index
  end

  def work
  end

  private
  def post_params
    params.require(:basic_setting_info_form).permit(
        basic_setting_info_forms_attributes: [
            :duration ,
            :interval,
            :notif_time
        ]
    )
  end

  def form_factory
    @form = if flash[:form]
              flash[:form]
            elsif params['basic_setting_info_form'].present?
              BasicSettingInfoForm.new(post_params)
            else
              BasicSettingInfoForm.new
            end
  end
end