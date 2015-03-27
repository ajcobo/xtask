$(document).on 'page:change', -> 
  $('.select2').each addSelect

$(document).on 'nested:fieldAdded', (e)->
  e.field.find('.select2').each addSelect

addSelect = (i, e) ->
    select = $(e)
    options = {}
    if select.hasClass('ajax')
      options.ajax =
        url: select.data('source')
        dataType: 'json'
        quietMillis: 100
        data: (term, page) ->
          {
            q: term
            page: page
            per: 10
          }
        results: (data, page) ->
          results = []
          $.each data, (index, item) ->
            results.push
              id: item.id
              text: item.name
          return {} = 
            results: results
      options.dropdownCssClass = 'bigdrop'
      options.placeholder = 'Select Mutant'
    select.select2 options
    return