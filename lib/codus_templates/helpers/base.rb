module CodusTemplates
  module Helpers
    module Base
      def display_flash_message
        return if flash.empty?
        alerts = flash.inject('') do |content, (key, message)|
          next unless [:success, :notice, :error, :danger, :warning, :info].include?(key)
          key = :success if key == :notice
          key = :danger if key == :error

          alert = content_tag :div, :class => "alert alert-#{key}" do
            content_tag(:p, message) unless message.blank?  || key == :timedout
          end.html_safe
          content << alert.html_safe
        end
        alerts.html_safe if alerts
      end

      def pagination_links_for(resource_list, param_name = 'page', custom_params = {})
        paginate(resource_list, param_name: "#{param_name}", params: custom_params, :theme => 'ace_template')
      end

      def pagination_ajax_links_for(resource_list, param_name = 'page', custom_params = {})
        paginate(resource_list, param_name: "#{param_name}", params: custom_params, :theme => 'ace_template', :remote => true)
      end
    end


    def get_title_text_for_header_section
      begin
        resource_name = controller_name.singularize.capitalize.constantize
      rescue
        resource_name = ""
      end

      if params[:action].match(/edit|update/)
        action_name = 'Editando'
        resource_name = resource_class.model_name.human
      elsif params[:action].match(/show/)
        action_name = 'Visualizando'
        resource_name = resource_class.model_name.human
      elsif params[:action].match(/remove/)
        action_name = 'Removendo'
        resource_name = resource_class.model_name.human.pluralize
      elsif params[:action].match(/index/)
        action_name = 'Listando'
        resource_name = resource_class.model_name.human.pluralize
      else
        action_name = 'Adicionando'
        resource_name = resource_class.model_name.human.pluralize
      end

      "#{action_name} #{resource_name}"
    end

  end
end
