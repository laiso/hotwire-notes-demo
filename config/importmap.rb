# Pin npm packages by running ./bin/importmap
pin_all_from "app/javascript/controllers", under: "controllers"
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "trix", to: "https://ga.jspm.io/npm:trix@2.0.0-alpha.1/dist/trix.js"
pin "@rails/actiontext", to: "https://ga.jspm.io/npm:@rails/actiontext@7.0.2-2/app/javascript/actiontext/index.js"
pin "@rails/activestorage", to: "https://ga.jspm.io/npm:@rails/activestorage@7.0.2-2/app/assets/javascripts/activestorage.esm.js"
