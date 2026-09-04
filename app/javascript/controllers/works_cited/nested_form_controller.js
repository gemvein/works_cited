import { Controller } from "@hotwired/stimulus"

// Replaces the old addFields.js/removeFields.js pair (hand-rolled
// document.querySelectorAll + `window.addEventListener('load', ...)`
// re-binding, which never fires again after the first Turbo navigation).
// The `works_cited_link_to_add_fields` helper still renders the "Add"
// link's `data-id`/`data-fields` attributes exactly as before - only the
// event wiring moved to Stimulus, which reconnects actions on newly
// inserted DOM automatically, so no manual re-scan/re-bind is needed.
export default class extends Controller {
  add(event) {
    event.preventDefault()
    const link = event.currentTarget
    const linkId = link.dataset.id
    if (!linkId) return

    const time = new Date().getTime()
    const regexp = new RegExp(linkId, "g")
    const newFields = link.dataset.fields.replace(regexp, time)
    link.insertAdjacentHTML("beforebegin", newFields)
  }

  remove(event) {
    event.preventDefault()
    const fieldParent = event.currentTarget.closest(".nested-fields")
    if (!fieldParent) return

    const deleteField = fieldParent.querySelector('input[type="hidden"]')
    if (!deleteField) return

    deleteField.value = "1"
    fieldParent.style.display = "none"
  }
}
