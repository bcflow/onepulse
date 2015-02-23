ActiveAdmin.register Sentence do
  permit_params :body, :tag_ids => []

  form partial: 'form'

end
