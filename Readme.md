# webdir-scripts

## move2dir.rb
move all filenames such as _2014_05_20_00_07_44.jpg  to yyyymmdd/hh/ directory

## create_index.rb
create file list index file in the current directory

## use sinatra, slim to view pictures

````nginx
# image files directory
location /imagedir {
    alias /data/ftp/tn30w;
    autoindex on;
    autoindex_localtime on;
    #auth_basic "Restricted";
    #auth_basic_user_file /path/to/pass.file;
    #allow 1.2.3.4;
    #allow 1.2.3.4/24;
    #deny all;
}

# for sinatra directory
location /archives {
  #index index.html index.htm index.php;
  proxy_set_header  X-Real-IP  $remote_addr;
  proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header Host $http_host;
  proxy_redirect off;
  if (-f $request_filename/index.html) {
    rewrite (.*) $1/index.html break;
  }
  if (-f $request_filename.html) {
    rewrite (.*) $1.html break;
  }
  if (!-f $request_filename) {
    proxy_pass http://picture;
    break;
  }
  #client_max_body_size 100m;
  #client_max_body_size 300m;
}
````

## to do
edit mail.rb, change the followed value.
PICroot = EDIT ME

## run it

`bundle exec thin start`
