function packInContainer(container, keyParts, value) {
  var part = keyParts.shift()
  var packed = value
  if(keyParts.length > 0) {
    var previous = container[part] || {}
    packed = packInContainer(previous, keyParts, value)
  }

  return {...container, [part]: packed}
}

function getWritableField(key) {
  var fields = document.getElementsByName(key)
  var found

  fields.forEach((field) => {
    if(field.readonly === undefined || !field.readonly) {
      if(field.value) {
        found = field.value
        return
      }
    }
  })

  return found || ''
}

function getFieldByLocator(data, locator) {
  var regex = /^\[(.*)\]$/
  var container = {}

  // Display the key/value pairs
  for(var pair of data.entries()) {
    // We want to avoid using pair[1] even though it's there because some fields are readonly
    var key = pair[0]
    if(key.startsWith(locator)) {
      var strippedKeyString = key.replace(locator, '').replace(regex, "$1")
      var keyParts = strippedKeyString.split('][')
      var value = getWritableField(key)
      console.warn(strippedKeyString)
      container = packInContainer(container, keyParts, value)
    }
  }

  return container
}

function getFormDataPacked(data) {
  var container = {}

  // Display the key/value pairs
  for(var pair of data.entries()) {
    // We want to avoid using pair[1] even though it's there because some fields are readonly
    var key = pair[0]
    container[key] = getWritableField(key)
  }

  return container
}