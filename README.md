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
