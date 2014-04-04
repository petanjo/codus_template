# encoding: utf-8

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

      def get_title_text_for_header_section
        begin
          resource_class = controller_name.singularize.capitalize.constantize
          resource_name = resource_class.model_name.human
          if params[:action].match(/index/)
            resource_name = resource_name.pluralize
          end
        rescue
          resource_name = ""
        end

        begin
          equivalent_actions_hash = {
            "edit" => :update,
            "new" => :create,
            "remove" => :destroy
          }

          if equivalent_actions_hash.has_key?(params[:action])
            action_text = I18n.t!(params[:action],
              scope: [:codus_templates, :header_titles, :controllers, params[:controller].parameterize(".")],
              default: equivalent_actions_hash[params[:action]])
          else
            action_text = I18n.t!(params[:action],
              scope: [:codus_templates, :header_titles, :controllers, params[:controller].parameterize(".")])
          end
        rescue I18n::MissingTranslationData => ex
          action_text = I18n.t(params[:action],
            scope: [:codus_templates, :header_titles, :defaults])
        end

        "#{action_text} #{resource_name}"
      end

      def multilanguage_attribute_field_for(attribute_name, simple_form_builder, custom_options = {})
        options = { input_options: {} }.merge(custom_options)

        if simple_form_builder.object
          human_attribute_name = simple_form_builder.object.class.human_attribute_name(attribute_name)
        end

        if options[:hide_field_name]
          output = ""
        else
          output = simple_form_builder.input attribute_name, label: human_attribute_name do
            ""
          end
        end

        multil(attribute_name) do |lattr, language|
          output += simple_form_builder.input lattr, options[:input_options].merge({label: flag_image_for(language)})
        end

        output.html_safe
      end

      def multilanguage_attribute_show_for(attribute_name, show_for_builder, options = {})
        if show_for_builder.object
          human_attribute_name = show_for_builder.object.class.human_attribute_name(attribute_name)
        end

        if options[:hide_field_name]
          output = ""
        else
          output = show_for_builder.attribute :attribute_name, label: human_attribute_name do
            ""
          end
        end

        multil(attribute_name) do |lattr, language|
          content = show_for_builder.object.send(lattr)
          content = "<span class='label label-default'>Não fornecido<span>" if content.blank?
          if options[:use_simple_format]
            output += show_for_builder.attribute(lattr, value: simple_format(content), label: flag_image_for(language))
          else
            output += show_for_builder.attribute(lattr, value: raw(content), label: flag_image_for(language))
          end
        end

        output.html_safe
      end

      def flag_image_for(language_acronym)
        image_tag("flags/#{language_acronym.to_s}.png")
      end
    end
  end
end
