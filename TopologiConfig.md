ANALISIS

koneksi R1 ke R2 dengan tunnel ip dari 11.11.11.2/29  KE  11.11.11.1/29

dari eth 2 = 192.168.1.1  milik R1

R2 menerima koneksi ke eth2 192.168.2.1

koneksi R2 ke R3

koneksi R2 ke R3 dengan tunnel ip dari 15.15.15.1/29  KE  15.15.15.2/29

dari eth 2 = 192.168.2.1  milik R2

R3 menerima koneksi ke eth2 192.168.3.1

koneksi R3 ke R2

koneksi R3 ke R2 dengan tunnel ip dari 15.15.15.2/29  KE  15.15.15.1/29

dari eth 2 = 192.168.3.1  milik R3

R2 menerima koneksi ke eth2 192.168.2.1

**KONEKSI R1 CR ke R3 KHI dan R3 KHI ke R1 CR:**

Komunikasi lintas kampus dari CR ke KHI dan sebaliknya harus melalui KJ karena KJ bertindak sebagai router pusat yang menghubungkan kedua kampus lainnya.

Misalnya, CR mengirimkan paket ke KHI dengan cara mengirimkannya terlebih dahulu ke KJ melalui tunnel yang tersedia, kemudian KJ meneruskannya ke KHI melalui tunnel lain. Proses sebaliknya berlaku untuk komunikasi dari KHI ke CR.

Kesimpulan: Kampus KJ berperan sebagai pusat penghubung utama dalam topologi jaringan ini, yang menghubungkan CR dan KHI. Struktur ini memanfaatkan dua terowongan IPIP yang terpisah untuk mengelola lalu lintas data antar kampus dengan efisien. Pendekatan ini tidak hanya menjamin pemisahan lalu lintas yang efektif antara berbagai lokasi, tetapi juga memastikan efisiensi optimal dalam pengelolaan data. Penggunaan routing statis dalam konfigurasi ini memastikan bahwa data selalu mencapai tujuan yang ditetapkan melalui jalur yang telah diatur

## SET NAT

router ke internet menggunakan dhcp Client ip > dhcp client > + > ether 1 > klik Ok

## SET IP

R1 CR
Tambahkan Ip address ip >addresses > + ip 1, 192.168.1.1/24 > Ether 2 ip 2, 11.11.11.1/29 > IPIP Tunnel

R2 KJ

Tambahkan Ip address ip >addresses  > + ip 1, 192.168.2.1/24  > Ether 2 ip 2, 11.11.11.1/29 > IPIP Tunnel IP 3, 15.15.15.1/29 > IPIP Tunnel 

R3 KHI

Tambahkan Ip address ip >addresses > + ip 1, 192.168.2.1/24  > Ether 2 ip 2, 11.11.11.1/29 > IPIP Tunnel IP 3, 15.15.15.1/29 > IPIP Tunnel

SET DHCP UNTUK SEMUA ROUTER R1 R2 R3

set DHCP Server untuk ETH 2 ip > Dhcp Server > Dhcp Setup > Next sampai selesai

## SET IPIP TUNNEL

#menambahkan interface IPIP Tunnel buka menu Interface  >  IP Tunnel  >  Add 

R1 CR

local address ; 20.5.5.2/29

remote address ; 20.5.5.1/29 , 20.3.3.2/29

R2 KJ

local address ;  20.5.5.1/29, 20.3.3.1/29

remote address ;  20.5.5.2/29, 20.3.3.2/29

R3 KHI

local address ;  20.3.3.2/29

remote address ; 20.3.3.1/29 ,  20.5.5.2/29

## routing static

Ip > routes +

R1-CR

destination address : ke r2 (192.168.2.0/24)  , ke r3 (192.168.3.0/24)

gateway : ke r2 (11.11.11.1) , ke r3 (15.15.15.2)

R2-KJ

destination address :ke r1 (192.168.1.0/24) , ke r3 (192.168.3.0/24)

gateway : ke r1 (11.11.11.2) , ke r3 (15.15.15.2)

R3-KHI

destination address : ke r2 (192.168.2.0/24) , ke r1 (192.168.1.0/24)

gateway : ke r2 (15.15.15.1) , ke r1 (11.11.11.2)