function startPreview(url, id, citationLocator) {
  var element = document.getElementById(id)
  var fields = element.querySelectorAll('input, select');
  var index = 0;

  for (index = 0; index < fields.length; ++index) {
    var textField = fields[index];
    textField.addEventListener('change', (e) => loadPreview(url, citationLocator))
  }
  loadPreview(url, citationLocator)
}

function loadPreview(url, locator) {
  // Build formData object.
  var formData = new FormData(document.querySelector('form'))
  var data = {}
  data.citation = getFieldByLocator(formData, locator)
  var authenticity_token = document.head.querySelector('meta[name="csrf-token"]').content
  var preview = document.getElementById('preview')
  var container = document.getElementById('preview-html')

  fetch(url + '.json',
    {
      method: 'post',
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': authenticity_token,
        'Content-type': 'application/json'
      },
      body: JSON.stringify(data),
      credentials: 'same-origin'
    })
    .then(function(response) {
      // When the page is loaded convert it to json
      return response.json()
    })
    .then(function(json) {
      // get the html value for it
      return json.html
    })
    .then((html) => {
      preview.style.display = 'block'
      container.innerHTML = html
    })
}