abi <abi/3.0>,
include <tunables/global>

profile bat /usr/bin/bat {
  include <abstractions/base>
  include <abstractions/bash>

  /{,**} r,

  # Source highlighting
  /usr/bin/{bash,dash} mrix,
  /usr/bin/source-highlight mrix,
  /usr/bin/src-hilite-lesspipe.sh mrix,

  # bat can be used to view protected files
  capability dac_read_search,
  capability dac_override,

  # Silence unnecessary permissions
  deny /{,**} w,
}

