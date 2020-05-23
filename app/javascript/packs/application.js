// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("jquery")
require("@rails/ujs").start()
require("turbolinks").start()
require('@client-side-validations/client-side-validations')
require("@rails/activestorage").start()
require("channels")
require("packs/appoinment")
require("packs/appoinment_dropdown")
require("packs/invoice_generate")
require("packs/service")
require("packs/bootstrap.min")
require("packs/ekko-lightbox")
require("packs/jquery-2.1.1.min")
require("packs/simple-lightbox")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)