from fabric.api import run,env,put,sudo

env.user = 'root'
env.password = 'password'
env.hosts = ['ipaddress']

def start_install():

  run('yum -y install openldap-clients nss-pam-ldapd nslcd')
  
  put('./ldap.conf','./')
  run('cp -f ldap.conf /etc/openldap/ldap.conf')
  
  put('./nslcd.conf','./')
  run('cp -f nslcd.conf /etc/nslcd.conf')

  put('./pam_ldap.conf','./')
  run('cp -f pam_ldap.conf /etc/pam_ldap.conf')
  
  put('./password-auth','./')
  run('cp -f password-auth /etc/pam.d/password-auth')
  
  put('./nsswitch.conf','./')
  run('cp -f nsswitch.conf /etc/nsswitch.conf')

  put('./authconfig','./')
  run('cp -f authconfig /etc/sysconfig/authconfig')

  run('chkconfig nslcd on')
  run('service nslcd start')

  #run('shutdown -r now')

