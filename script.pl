print "install...";
print `yum -y install openldap-clients nss-pam-ldapd nslcd`;
sleep(1);

print "config...ldap.conf\n";
print `cp -f ldap.conf /etc/openldap/ldap.conf`;
sleep(1);

print "config...nslcd.conf\n";
print `cp -f nslcd.conf /etc/nslcd.conf`;
sleep(1);

print "config...pam_ldap.conf\n";
print `cp -f pam_ldap.conf /etc/pam_ldap.conf`;
sleep(1);

print "config...password-auth\n";
print `cp -f password-auth /etc/pam.d/password-auth`;
sleep(1);

print "config...nsswitch\n";
print `cp -f nsswitch.conf /etc/nsswitch.conf`;
sleep(1);

print "config...authconfig\n";
print `cp -f authconfig /etc/sysconfig/authconfig`;
sleep(1);

print "auto start nslcd\n";
print `chkconfig nslcd on`;
sleep(1);

print "start nslcd\n";
print `service nslcd start`;
sleep(1);
#print `shutdown -r now`;
