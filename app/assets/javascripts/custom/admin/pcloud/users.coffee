window.RailsApp.admin_pcloud_users =

  init: ->

    # 取得 elements
    form = $('#revoke-user')
    # 設定 form validator
    confirm = 0
    form.validator().on 'submit', (e) ->
      if !e.isDefaultPrevented()
        if confirm == 0
          e.preventDefault()
          bootbox.confirm
            message: '是否確認刪除 ' + $('#email').val() + ' 帳號'
            buttons:
              confirm:
                label: '確認'
                className: 'btn-danger'
              cancel:
                label: '取消'
                className: 'btn-default pull-right'
            callback: (result) ->
              if result == true
                confirm += 1
                form.submit()
              else
                confirm = 0
        else if confirm == 1
          e.preventDefault()
          bootbox.confirm
            message: '請再次確認刪除 '  + $('#email').val() + ' 帳號'
            buttons:
              confirm:
                label: '確認'
                className: 'btn-danger pull-right'
              cancel:
                label: '取消'
                className: 'btn-default'
            callback: (result) ->
              if result == true
                confirm += 1
                form.submit()
              else
                confirm = 0