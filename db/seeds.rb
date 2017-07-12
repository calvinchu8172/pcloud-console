if Group.all.count == 0
  Group.create(name: 'System Management')
  Group.create(name: 'Push Management')
end
