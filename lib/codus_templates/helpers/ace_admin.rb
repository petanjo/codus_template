# encoding: utf-8

module CodusTemplates
  module Helpers
    module AceAdmin
      include CodusTemplates::Helpers::Base

      def panel_section(custom_options = {}, &block)

        if params[:action].match(/edit|update/)
          panel_name = t(:form)
        elsif params[:action].match(/show/)
          panel_name = t(:details)
        else
          panel_name = t(:form)
        end

        options = {
          name: panel_name,
          class: 'widget-box',
          id: ""
        }.merge(custom_options)

        content_tag(:div, class: options[:class], id: options[:id]) do
          title = content_tag(:div, "<h3 class='lighter'>#{options[:name]}</h3>".html_safe , class: 'widget-header widget-header-blue widget-header-flat')
          body = content_tag(:div, class: 'widget-body') do
            content_tag(:div, capture(&block),class: 'widget-main')
          end
          title + body
        end
      end

      def header_section(custom_options = {})
        options = {
          title: get_title_text_for_header_section,
          right_links: get_right_links_for_header_section,
          header_tag: :h1
        }.merge(custom_options)

        content_tag(:div, class: 'page-header') do
          content_tag(options[:header_tag]) do
            ("<span class='text'>#{options[:title]}</span>" + options[:right_links].to_s).html_safe
          end
        end
      end

      def get_right_links_for_header_section
        begin
          right_links = custom_options.has_key?(:right_links) ? '' : link_to(get_translation_for_button(:back), {action: 'index'}, {class: 'btn btn-sm btn-primary pull-right'})
        rescue
          right_links = ""
        end

        if params[:action].match(/index/)
          begin
            right_links = link_to("<span class='glyphicon glyphicon-plus'></span> #{get_translation_for_button(:add)}".html_safe, { action: :new }, class: 'btn btn-sm btn-success pull-right cpy-add-link')
          rescue
            right_links = ""
          end
        end

        right_links
      end

      def form_submit_section(custom_options = {})
        options = {
          back_button_name: get_translation_for_button(:back),
          submit_button_name: get_translation_for_button(:save)
        }.merge(custom_options)
        content_tag(:div, class: 'form-actions wizard-actions form-buttons') do
          begin
            back_link = link_to("<i class='icon-arrow-left'></i> #{options[:back_button_name]}".html_safe, {action: 'index'}, {class: 'btn btn-prev'})
          rescue
            back_link = link_to("<i class='icon-arrow-left'></i> #{options[:back_button_name]}".html_safe, :back, {class: 'btn btn-prev'})
          end
          submit_button = "<button class='btn btn-success btn-next cpy-submit-button'>#{options[:submit_button_name]} <i class='icon-arrow-right icon-on-right'></i></button> ".html_safe
          back_link + submit_button
        end
      end

      def show_panel_buttons_section(custom_options = {})
        options = {
          back_button_name: get_translation_for_button(:back),
          edit_button_name: get_translation_for_button(:edit)
        }.merge(custom_options)

        buttons = content_tag(:div, class: 'wizard-actions') do
          if options[:path_to_return]
            back_link = link_to("<i class='icon-arrow-left'></i> #{options[:back_button_name]}".html_safe, options[:path_to_return].to_sym, {class: 'btn btn-prev'})
          else
            begin
              back_link = link_to("<i class='icon-arrow-left'></i> #{options[:back_button_name]}".html_safe, {action: 'index'}, {class: 'btn btn-prev'})
            rescue
              back_link = link_to("<i class='icon-arrow-left'></i> #{options[:back_button_name]}".html_safe, :back, {class: 'btn btn-prev'})
            end
          end
          begin
            edit_link = link_to("<i class='icon-edit'></i> #{options[:edit_button_name]}".html_safe, {action: 'edit'}, {class: 'btn btn-info'})
          rescue
            edit_link = ''
          end

          begin
            edit_link = link_to("<i class='icon-edit'></i> #{options[:edit_button_name]}".html_safe, {action: 'edit'}, {class: 'btn btn-info'})
          rescue
            edit_link = ''
          end

          back_link + edit_link
        end
        ("<hr/>".html_safe + buttons)
      end
    end
  end
end
