; Drush make file

core = 7.x
api = 2

projects[drupal][type] = core
projects[drupal][version] = "7.43"

;;;;;;;;;;;;;;;;;;;;;;;
; Contributed modules ;
;;;;;;;;;;;;;;;;;;;;;;;

projects[coder][subdir] = "contrib"
projects[coder][version] = "2.5"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.9"
projects[ctools][patch][] = "https://www.drupal.org/files/issues/deprecating_php4_style-2528736-23.patch"

projects[devel][subdir] = "contrib"
projects[devel][version] = "1.5"

projects[diff][subdir] = "contrib"
projects[diff][version] = "3.2"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.7"

projects[features][subdir] = "contrib"
projects[features][version] = "2.10"

projects[piwik][subdir] = "contrib"
projects[piwik][version] = "2.8"

projects[reroute_email][subdir] = "contrib"
projects[reroute_email][version] = "1.2"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[views][subdir] = "contrib"
projects[views][version] = "3.13"

projetcs[atools][subdir] = "contrib"
projects[atools][download][type] = "git"
projects[atools][download][url] = "git@gitlab.alethes.be:alethes/atools.git"
