window.RailsApp.admin_push_app_groups_apps =

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
      order: [[3, 'desc']]
      columns: [
        null
        null
        null
        null
        null
        { orderable: false }
      ]

  init: ->

    $('#loadCredentials').on 'click', ->
      if $('#push_app_password').val() == ''
        alert('請輸入密碼')
      if document.getElementById('push_app_file').files[0] == undefined
        alert('請上傳 P12 檔案')
      password = $('#push_app_password').val()
      file = document.getElementById('push_app_file').files[0]
      reader = new FileReader

      reader.onload = ->
        try
          p12b64 = reader.result.substr(reader.result.indexOf(',') + 1)
          p12Der = forge.util.decode64(p12b64)
          p12Asn1 = forge.asn1.fromDer(p12Der)
          pkcs12 = forge.pkcs12.pkcs12FromAsn1(p12Asn1, password)
          privateKeyBags = pkcs12.getBags(bagType: forge.pki.oids.pkcs8ShroudedKeyBag)
          certificateBags = pkcs12.getBags(bagType: forge.pki.oids.certBag)
          certificate = certificateBags[forge.pki.oids.certBag][0].cert
          certificatePem = forge.pki.certificateToPem(certificate)
          privateKey = privateKeyBags[forge.pki.oids.pkcs8ShroudedKeyBag][0].key
          privateKeyPem = forge.pki.privateKeyToPem(privateKey)
          $('#push_app_certificate').val certificatePem
          $('#push_app_private_key').val privateKeyPem
        catch err
          alert err.message

      reader.onerror = (error) ->
        console.log 'Error: ', error

      reader.readAsDataURL file

  new: ->

    $('#push_app_platform').select2()
