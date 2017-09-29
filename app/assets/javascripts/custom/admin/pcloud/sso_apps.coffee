window.RailsApp.admin_pcloud_sso_apps =

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
      order: [[2, 'asc']]
      columns: [
        null
        null
        null
        { orderable: false }
        { orderable: false }
      ]
      columnDefs: [
        {
          targets: [ 2 ],
          visible: false
        }
      ]