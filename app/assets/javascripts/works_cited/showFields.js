function showFields(citation_id, citation_type) {
  citation = document.getElementById(`citation-${citation_id}`)
  for (let element of citation.getElementsByClassName('fields')){
    element.style.display='none'
    element.readonly=true
  }
  console.warn(citation.getElementsByClassName(`fields-${citation_type}`)[0])
  citation.getElementsByClassName(`fields-${citation_type}`)[0].style.display = 'block'
}