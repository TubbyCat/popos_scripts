#!/bin/env bash

#partial debloat for Pop! OS linux 22.04 LTS
#THIS SCRIPT COMES WITH ABSOLUTELY NO WARRANTY
#THE AUTHOR DISCLAIMS ANY LIABILITY FOR DAMAGES
#THE AUTHOR MAY MODIFY THIS SCRIPT WITHOUT PRIOR WARNING

#Working assumption is that user is a grown-up who can manually install their own packages as needed. Prior to such action, said big-boy user would prefer a harddrive which is not as cluttered by useless packages. 
#It is a wortwhile act, in principle, to remove unnecessary packages from a system so as to limit the number of packages for which there could exist undisclosed vulnerabilities. 

#Removes language packs != english

echo "
////////////////////////////////////////////////////////////////////////////////
TubbyCat's quote of the f*cking day:

\"Sanity is pre-installing a billion language packs and expecting
the end user to delete said steaming pile of excrement,
despite having a section for language selection DURING the initial install.\"

    - Albert Edison, first penguin to walk on the sun.

////////////////////////////////////////////////////////////////////////////////"

if [[ $UID -ne 0 ]]; then
echo '
You need root to proceed, please try again.

If you have not read this script: STOP!
ALWAYS READ A SHELL SCRIPT BEFORE YOU RUN IT.'


exit 1
else
  echo ' Partial removal of bloat packages. Many cannot be removed despite being removable in other debian-based distros e.g avahi-daemon.
  Some such pkgs are advised for removal for security reasons. See: system hardening guides.
  Maybe complaining to devs will (likely not) help...'

  RM="apt-get purge -y"

  $RM *telnet* apport bpfcc-tools avahi-utils baobab blt bolt docbook-xml *eddy ftp gnome-remote* dleyna-server  friendly-recovery gkbd-capplet icu-devtools modemmanager mtr-tiny mobile-broadband* rtmpdump ruby* rygel *upnp* yelp popsicle* javascript-common whoopsie tcpdump

  #OPTIONAL / DISCRETIONARY. Hint: RUN apt info $packagename for what it does.

  # $RM totem* geary pop-shop ibus-table-quick-classic ibverbs-providers
  $RM gnome-accessibility-themes gnome-font-viewer gnome-weather 
  #$RM cups-browsed cups-pk-helper sane-airscan sane-utils 
  #$RM ntfs-3g 
  
  #If you do not want ENGLISH language packs, uncomment following AND DO COMMENT OUT OR REMOVE NEEDED LANGS BELOW!!!:
  # $RM mythes-en* language-pack-gnome-en* language-pack-en* hunspell-en* hyphen-en* wamerican wbritish wcanadian* 

  # Language pack removal

  echo 'Langpacks being deleted.. be patient. Script will exit on its own.'

  #Elaborated code, in case you want to keep certain languages.

  $RM hunspell-a* hunspell-d* hunspell-es* hunspell-i* hunspell-p* hunibus-table-quick-classicspell-ar hunspell-p* hunspell-ru hunspell-en-za hunspell-fr* 
  $RM gnome-user-docs-de* gnome-user-docs-es* gnome-user-docs-fr* gnome-user-docs-it* gnome-user-docs-ja* gnome-user-docs-pt* gnome-user-docs-ru* gnome-user-docs-zh-hans* 
  $RM language-pack-gnome-a* language-pack-gnome-es* language-pack-gnome-d* language-pack-gnome-fr* language-pack-gnome-i* language-pack-gnome-j* language-pack-gnome-ru* language-pack-gnome-z* language-pack-i* language-pack-j* language-pack-p* language-pack-r* language-pack-zh-han* language-pack-gnome-ar* language-pack-ar* language-pack-fr* language-pack-de* language-pack-es*
  $RM mythes-ar* mythes-de* mythes-de-ch* mythes-en-au* mythes-es* mythes-fr* mythes-it* mythes-pt* mythes-ru* hyphen-de hyphen-es hyphen-fr hyphen-it hyphen-p* hyphen-ru* 
  $RM wspanish wbrazilian* wfrench* witalian* wngerman* wogerman* wportuguese* wswiss* wswedish wdanish wdutch wukranian 
  $RM pocketsphinx* wgerman* wbulgarian wnorwegian 
  #Asian typing removal
  $RM *pinyin* ibus-chewing ibus-table-cangjie* ibus-table-wubi 

  #Further Language Pack related bloatware
  $RM krb5-locales 
  $RM libreoffice-help* 
  $RM qttranslations5-l10n 
  exit 0
fi
