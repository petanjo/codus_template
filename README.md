# How to install

```ruby
gem 'codus_templates', :git => 'git://github.com/rails/rails.git', :tag => 'v1.4'
```

# How to use the layout helpers
Include the helper in your base helper. Example:
```ruby
include CodusTemplates::Helpers::AceAdmin
```

# Translates
You can personalize the header section titles and default buttons following the pattern:

```yaml
pt_br:
  codus_templates:
    buttons_titles:
      defaults:
        add: 'Adicionar'
        save: 'Salvar'
        back: 'Voltar'
      controllers:
        controller_name:
          add: 'My custom add title for a controller'
    header_titles:
      defaults:
        index: 'Listando'
        edit: 'Editando'
        new: 'Adicionando'
        show: 'Visualizando'
      controllers:
        controller_name:
          edit: 'My custom edit title'
        namespace:
          controller_name:
            index: 'My custom index title'
``

# ShowFor initializer
```ruby

ShowFor.setup do |config|
  config.wrapper_tag = :div
  config.wrapper_class = "attributes-wrapper"

  # The tag used to wrap each label. Default is :strong.
  config.label_tag = :div
  config.label_class = "attribute-title"

  # The tag used to wrap each content (value). Default is nil.
  config.content_tag = :div
  config.content_class = "content"

  # The DOM class set for blank content tags. Default is "blank".
  # config.blank_content_class = 'no_content'

  # The separator between label and content. Default is "<br />".
  config.separator = ""


  # The tag which wraps show_for calls.
  config.show_for_tag = :div
end

```

# Personalize Rails confirm dialog
```javascript
var myCustomConfirmBox = function(message, callback) {
  var options;
  options = {
    message: message,
    title: "Confirmação",
    buttons: {
      success: {
        label: "Confirmar",
        className: "btn-success",
        callback: callback
      },
      danger: {
        label: "Cancelar",
        className: "btn-danger"
      }
    }
  };

  return bootbox.dialog(options);
};

$.rails.allowAction = function(element) {
  var answer, callback, message;
  message = element.data("confirm");
  if (!message) {
    return true;
  }
  answer = false;
  callback = void 0;
  if ($.rails.fire(element, "confirm")) {
    myCustomConfirmBox(message, function() {
      var oldAllowAction;
      callback = $.rails.fire(element, "confirm:complete", [answer]);
      if (callback) {
        oldAllowAction = $.rails.allowAction;
        $.rails.allowAction = function() {
          return true;
        };
        element.trigger("click");
        return $.rails.allowAction = oldAllowAction;
      }
    });
  }
  return false;
};
```
