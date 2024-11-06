# jan/02/1970 00:53:10 by RouterOS 6.49.8
# software id = RWA7-BHWK
#
# model = RB941-2nD
# serial number = HF609BYEWH7
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
add name=dhcp_pool1 ranges=192.168.2.2-192.168.2.254
add name=dhcp_pool2 ranges=192.168.2.2-192.168.2.254
add name=dhcp_pool3 ranges=192.168.3.2-192.168.3.254
/ip dhcp-server
add address-pool=dhcp_pool3 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.3.1/24 interface=ether2 network=192.168.3.0
add address=20.20.20.2/24 interface=ether3 network=20.20.20.0
add address=30.30.30.2/24 interface=ether4 network=30.30.30.0
/ip dhcp-server network
add address=192.168.2.0/24 gateway=192.168.2.1
add address=192.168.3.0/24 gateway=192.168.3.1
/routing rip interface
add interface=ether3
add interface=ether4
/routing rip neighbor
add address=20.20.20.1
add address=30.30.30.1
/routing rip network
add network=30.30.30.0/24
add network=20.20.20.0/24
/system identity
set name=UTS_JarLut
