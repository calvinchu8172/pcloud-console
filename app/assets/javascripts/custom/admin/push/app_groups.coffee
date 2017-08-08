window.RailsApp.admin_push_app_groups =

  index: ->

    $('.table').DataTable
      language:
        processing: "處理中..."
        loadingRecords: "載入中..."
        lengthMenu: "顯示 _MENU_ 項結果"
        zeroRecords: "沒有符合的結果"
        info: "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項"
        infoEmpty: "顯示第 0 至 0 項結果，共 0 項"
        infoFiltered: "(從 _MAX_ 項結果中過濾)"
        infoPostFix: ""
        search: "搜尋:"
        paginate:
          first: "第一頁"
          previous: "上一頁"
          next: "下一頁"
          last: "最後一頁"
        aria:
          sortAscending: ": 升冪排列"
          sortDescending: ": 降冪排列"
      pagingType: "full_numbers"
      order: [[2, 'desc']]
      columns: [
        null
        null
        null
        null
        { orderable: false }
      ]

  show: ->

    $('.table').DataTable
      language:
        processing: "處理中..."
        loadingRecords: "載入中..."
        lengthMenu: "顯示 _MENU_ 項結果"
        zeroRecords: "沒有符合的結果"
        info: "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項"
        infoEmpty: "顯示第 0 至 0 項結果，共 0 項"
        infoFiltered: "(從 _MAX_ 項結果中過濾)"
        infoPostFix: ""
        search: "搜尋:"
        paginate:
          first: "第一頁"
          previous: "上一頁"
          next: "下一頁"
          last: "最後一頁"
        aria:
          sortAscending: ": 升冪排列"
          sortDescending: ": 降冪排列"
      pagingType: "full_numbers"
      order: [[3, 'desc']]
      columns: [
        null
        null
        null
        null
        null
        { orderable: false }
      ]

  notification: ->

    $('select[id*=push_notification_app_ids]').select2()
    $('select[id*=push_notification_email]').select2()

