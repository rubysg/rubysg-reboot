FrozenRecord::Base.base_path = "#{Rails.root}/db/data"

unless Rails.env.production?
  FrozenRecord::Base.auto_reloading = true
end
