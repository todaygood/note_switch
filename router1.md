## IT技术
 

[R5]display bgp ?
  bfd                Bidirectional forwarding detection
  error              Error infomation
  group              Peer groups
  ipv6               Specify IPv6 unicast address family
  multicast          <Group> multicast command group
  network            Routes advertised through network command
  paths              Path attribute information
  peer               Peer routers
  routing-table      Display BGP routing table
  update-peer-group  Update peer group
  vpnv4              Specify VPNv4 address family
  vpnv6              Specify VPNv6 address family
[R5]display bgp networ	
[R5]display bgp network 
 

  BGP Local Router ID is 10.0.5.5
  Local AS Number is 64514(Public)
  Network          Mask            Route-policy

  10.1.5.0         255.255.255.0                   

[R5]dis bgp routing-table 

 BGP Local router ID is 10.0.5.5 
 Status codes: * - valid, > - best, d - damped,
               h - history,  i - internal, s - suppressed, S - Stale
               Origin : i - IGP, e - EGP, ? - incomplete


 Total Number of Routes: 2
      Network            NextHop        MED        LocPrf    PrefVal Path/Ogn

 *>   10.1.4.0/24        10.0.35.3                             0      64512 6451
3i
 *>   10.1.5.0/24        0.0.0.0         0                     0      i