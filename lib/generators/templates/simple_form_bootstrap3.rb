# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap3, :tag => 'div', :class => 'form-group', :error_class => 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { tag: 'div', class: 'col-md-3 text-right' }
    b.wrapper tag: :div, class: 'col-lg-6' do |component|
      component.use :input
      component.use :error, wrap_with: { tag: 'label', class: 'error' }
      component.use :hint, wrap_with: { tag: 'label', class: 'error' }
    end
  end

  config.wrappers :bootstrap3_full_space, :tag => 'div', :class => 'form-group', :error_class => 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { tag: 'div', class: 'col-md-3 text-right' }
    b.wrapper tag: :div, class: 'col-lg-9' do |component|
      component.use :input
      component.use :error, wrap_with: { tag: 'label', class: 'error' }
      component.use :hint, wrap_with: { tag: 'label', class: 'error' }
    end
  end

  config.form_class = "form-horizontal"
  config.input_class = "form-control"

  config.default_wrapper = :bootstrap3
end
