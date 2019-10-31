jQuery(document).on 'turbolinks:load', ->
  $('#to').select2
    ajax: {
      url: '/cocktails'
      data: (params) ->
        {
          term: params.search.names
        }
      dataType: 'json'
      delay: 500
      processResults: (data, params) ->
        {
          results: _.map(data, (el) ->
            {
              id: el.id
              name: "#{el.name}"
            }
          )
        }
      cache: true
    }
    escapeMarkup: (markup) -> markup
    minimumInputLength: 2
    templateResult: (item) -> item.name
    templateSelection: (item) -> item.name
