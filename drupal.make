; Drush make file

core = 7.x
api = 2

projects[drupal][type] = core
projects[drupal][version] = "7.41"

;;;;;;;;;;;;;;;;;;;;;;;
; Contributed modules ;
;;;;;;;;;;;;;;;;;;;;;;;

projects[coder][subdir] = "contrib"
projects[coder][version] = "2.5"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.9"

projects[devel][subdir] = "contrib"
projects[devel][version] = "1.5"

projects[diff][subdir] = "contrib"
projects[diff][version] = "3.2"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.6"

projects[features][subdir] = "contrib"
projects[features][version] = "2.7"

projects[piwik][subdir] = "contrib"
projects[piwik][version] = "2.7"

projects[reroute_email][subdir] = "contrib"
projects[reroute_email][version] = "1.2"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[views][subdir] = "contrib"
projects[views][version] = "3.13"