# Port proxy'ing for Pow => port-proxy 3501 my-app-dirname
function port-proxy(){
  echo $1 > ~/.pow/$2
}

# Stop nginx
function ngstop(){
  sudo kill -QUIT $( cat /var/run/nginx.pid )
}

# Print all 256 colors to terminal for testing
aa_256 ()
{
  ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;
  for i in {0..256};
  do
  o=00$i;
  echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;
  done )
}

function portsql(){
  sudo port $1 postgresql92-server
}

function solr(){
  bundle exec rake sunspot:solr:$1
}

# get tmuxinator working with rbenv http://prioritized.net/blog/using-rbenv-with-tmuxinator/
function rvm () {
  if [[ $1 == 'use' ]]; then
    rbenv shell $2
  fi
}
