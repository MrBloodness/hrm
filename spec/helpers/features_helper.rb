module FeatureHelper
  def submit_button
    find_link(I18n.t('actions.register'))
  end

  def modal_save_button
    'footer_save_button'
  end

  def filter_button
    I18n.t('actions.filter')
  end

  def invite_link
    find_link(I18n.t('actions.invite'))
  end

  def show_link
    find_link(I18n.t('actions.show'))
  end

  def new_link
    find_link(I18n.t('actions.new'))
  end

  def edit_link
    find_link(I18n.t('actions.edit'))
  end

  def edit_path
    URI(edit_link[:href]).path
  end

  def delete_path
    URI(delete_link[:href]).path
  end

  def delete_link
    find_link(I18n.t('actions.delete'))
  end

  def destroy_link
    find_link(I18n.t('actions.destroy'))
  end

  def cancel_link
    find_link(I18n.t('actions.cancel'))
  end

  def filter_link
    find('a.filter-dropdown-link')
  end

  def create_notice(resource_key)
    build_notice('create', resource_key)
  end

  def update_notice(resource_key)
    build_notice('update', resource_key)
  end

  def destroy_notice(resource_key)
    build_notice('destroy', resource_key)
  end

  def build_notice(type, resource_key)
    I18n.t("flash.actions.#{type}.notice",
      resource_name: resource_key.to_s.classify.constantize.model_name.human)
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end

  def submit_form(page, id)
    page.execute_script("$('form##{id}').submit()")
  end
end
