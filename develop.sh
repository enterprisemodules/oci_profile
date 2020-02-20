alias into="docker exec -it oci_profile bash"
alias stop="docker kill oci_profile"
docker run --rm -d --name oci_profile \
  -h oci \
  -v $PWD:/root \
  -v $PWD/../oci_profile:/etc/puppetlabs/code/environments/production/modules/oci_profile \
  -v $PWD/../oci_config:/etc/puppetlabs/code/environments/production/modules/oci_config \
  -v $PWD/../easy_type:/etc/puppetlabs/code/environments/production/modules/easy_type \
  -v ~/software:/software \
  enterprisemodules/acc_base:latest /usr/sbin/init
docker exec oci_profile rpm -Uvh https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm
docker exec oci_profile yum install gcc make puppet git which -y
docker exec oci_profile /opt/puppetlabs/puppet/bin/gem install  specific_install byebug pry bolt --no-ri --no-rdoc
docker exec oci_profile /opt/puppetlabs/puppet/bin/gem specific_install -l https://github.com/enterprisemodules/oci-ruby-sdk.git
docker exec oci_profile /opt/puppetlabs/bin/puppet apply /software/tenant_setup.pp -t
docker exec -it oci_profile bash