module mime

pub const db = {
	'application/1d-interleaved-parityfec':                                                 MimeType{'iana', [], false, ''}
	'application/3gpdash-qoe-report+xml':                                                   MimeType{'iana', [], true, ''}
	'application/3gpp-ims+xml':                                                             MimeType{'iana', [], true, ''}
	'application/a2l':                                                                      MimeType{'iana', [], false, ''}
	'application/activemessage':                                                            MimeType{'iana', [], false, ''}
	'application/activity+json':                                                            MimeType{'iana', [], true, ''}
	'application/alto-costmap+json':                                                        MimeType{'iana', [], true, ''}
	'application/alto-costmapfilter+json':                                                  MimeType{'iana', [], true, ''}
	'application/alto-directory+json':                                                      MimeType{'iana', [], true, ''}
	'application/alto-endpointcost+json':                                                   MimeType{'iana', [], true, ''}
	'application/alto-endpointcostparams+json':                                             MimeType{'iana', [], true, ''}
	'application/alto-endpointprop+json':                                                   MimeType{'iana', [], true, ''}
	'application/alto-endpointpropparams+json':                                             MimeType{'iana', [], true, ''}
	'application/alto-error+json':                                                          MimeType{'iana', [], true, ''}
	'application/alto-networkmap+json':                                                     MimeType{'iana', [], true, ''}
	'application/alto-networkmapfilter+json':                                               MimeType{'iana', [], true, ''}
	'application/aml':                                                                      MimeType{'iana', [], false, ''}
	'application/andrew-inset':                                                             MimeType{'iana', [
		'ez',
	], false, ''}
	'application/applefile':                                                                MimeType{'iana', [], false, ''}
	'application/applixware':                                                               MimeType{'apache', [
		'aw',
	], false, ''}
	'application/atf':                                                                      MimeType{'iana', [], false, ''}
	'application/atfx':                                                                     MimeType{'iana', [], false, ''}
	'application/atom+xml':                                                                 MimeType{'iana', [
		'atom',
	], true, ''}
	'application/atomcat+xml':                                                              MimeType{'iana', [
		'atomcat',
	], true, ''}
	'application/atomdeleted+xml':                                                          MimeType{'iana', [], true, ''}
	'application/atomicmail':                                                               MimeType{'iana', [], false, ''}
	'application/atomsvc+xml':                                                              MimeType{'iana', [
		'atomsvc',
	], true, ''}
	'application/atsc-dwd+xml':                                                             MimeType{'iana', [], true, ''}
	'application/atsc-held+xml':                                                            MimeType{'iana', [], true, ''}
	'application/atsc-rsat+xml':                                                            MimeType{'iana', [], true, ''}
	'application/atxml':                                                                    MimeType{'iana', [], false, ''}
	'application/auth-policy+xml':                                                          MimeType{'iana', [], true, ''}
	'application/bacnet-xdd+zip':                                                           MimeType{'iana', [], false, ''}
	'application/batch-smtp':                                                               MimeType{'iana', [], false, ''}
	'application/bdoc':                                                                     MimeType{'', [
		'bdoc',
	], false, ''}
	'application/beep+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/calendar+json':                                                            MimeType{'iana', [], true, ''}
	'application/calendar+xml':                                                             MimeType{'iana', [], true, ''}
	'application/call-completion':                                                          MimeType{'iana', [], false, ''}
	'application/cals-1840':                                                                MimeType{'iana', [], false, ''}
	'application/cbor':                                                                     MimeType{'iana', [], false, ''}
	'application/cccex':                                                                    MimeType{'iana', [], false, ''}
	'application/ccmp+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/ccxml+xml':                                                                MimeType{'iana', [
		'ccxml',
	], true, ''}
	'application/cdfx+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/cdmi-capability':                                                          MimeType{'iana', [
		'cdmia',
	], false, ''}
	'application/cdmi-container':                                                           MimeType{'iana', [
		'cdmic',
	], false, ''}
	'application/cdmi-domain':                                                              MimeType{'iana', [
		'cdmid',
	], false, ''}
	'application/cdmi-object':                                                              MimeType{'iana', [
		'cdmio',
	], false, ''}
	'application/cdmi-queue':                                                               MimeType{'iana', [
		'cdmiq',
	], false, ''}
	'application/cdni':                                                                     MimeType{'iana', [], false, ''}
	'application/cea':                                                                      MimeType{'iana', [], false, ''}
	'application/cea-2018+xml':                                                             MimeType{'iana', [], true, ''}
	'application/cellml+xml':                                                               MimeType{'iana', [], true, ''}
	'application/cfw':                                                                      MimeType{'iana', [], false, ''}
	'application/clue_info+xml':                                                            MimeType{'iana', [], true, ''}
	'application/cms':                                                                      MimeType{'iana', [], false, ''}
	'application/cnrp+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/coap-group+json':                                                          MimeType{'iana', [], true, ''}
	'application/coap-payload':                                                             MimeType{'iana', [], false, ''}
	'application/commonground':                                                             MimeType{'iana', [], false, ''}
	'application/conference-info+xml':                                                      MimeType{'iana', [], true, ''}
	'application/cose':                                                                     MimeType{'iana', [], false, ''}
	'application/cose-key':                                                                 MimeType{'iana', [], false, ''}
	'application/cose-key-set':                                                             MimeType{'iana', [], false, ''}
	'application/cpl+xml':                                                                  MimeType{'iana', [], true, ''}
	'application/csrattrs':                                                                 MimeType{'iana', [], false, ''}
	'application/csta+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/cstadata+xml':                                                             MimeType{'iana', [], true, ''}
	'application/csvm+json':                                                                MimeType{'iana', [], true, ''}
	'application/cu-seeme':                                                                 MimeType{'apache', [
		'cu',
	], false, ''}
	'application/cwt':                                                                      MimeType{'iana', [], false, ''}
	'application/cybercash':                                                                MimeType{'iana', [], false, ''}
	'application/dart':                                                                     MimeType{'', [], true, ''}
	'application/dash+xml':                                                                 MimeType{'iana', [
		'mpd',
	], true, ''}
	'application/dashdelta':                                                                MimeType{'iana', [], false, ''}
	'application/davmount+xml':                                                             MimeType{'iana', [
		'davmount',
	], true, ''}
	'application/dca-rft':                                                                  MimeType{'iana', [], false, ''}
	'application/dcd':                                                                      MimeType{'iana', [], false, ''}
	'application/dec-dx':                                                                   MimeType{'iana', [], false, ''}
	'application/dialog-info+xml':                                                          MimeType{'iana', [], true, ''}
	'application/dicom':                                                                    MimeType{'iana', [], false, ''}
	'application/dicom+json':                                                               MimeType{'iana', [], true, ''}
	'application/dicom+xml':                                                                MimeType{'iana', [], true, ''}
	'application/dii':                                                                      MimeType{'iana', [], false, ''}
	'application/dit':                                                                      MimeType{'iana', [], false, ''}
	'application/dns':                                                                      MimeType{'iana', [], false, ''}
	'application/dns+json':                                                                 MimeType{'iana', [], true, ''}
	'application/dns-message':                                                              MimeType{'iana', [], false, ''}
	'application/docbook+xml':                                                              MimeType{'apache', [
		'dbk',
	], true, ''}
	'application/dskpp+xml':                                                                MimeType{'iana', [], true, ''}
	'application/dssc+der':                                                                 MimeType{'iana', [
		'dssc',
	], false, ''}
	'application/dssc+xml':                                                                 MimeType{'iana', [
		'xdssc',
	], true, ''}
	'application/dvcs':                                                                     MimeType{'iana', [], false, ''}
	'application/ecmascript':                                                               MimeType{'iana', [
		'ecma',
		'es',
	], true, ''}
	'application/edi-consent':                                                              MimeType{'iana', [], false, ''}
	'application/edi-x12':                                                                  MimeType{'iana', [], false, ''}
	'application/edifact':                                                                  MimeType{'iana', [], false, ''}
	'application/efi':                                                                      MimeType{'iana', [], false, ''}
	'application/emergencycalldata.comment+xml':                                            MimeType{'iana', [], true, ''}
	'application/emergencycalldata.control+xml':                                            MimeType{'iana', [], true, ''}
	'application/emergencycalldata.deviceinfo+xml':                                         MimeType{'iana', [], true, ''}
	'application/emergencycalldata.ecall.msd':                                              MimeType{'iana', [], false, ''}
	'application/emergencycalldata.providerinfo+xml':                                       MimeType{'iana', [], true, ''}
	'application/emergencycalldata.serviceinfo+xml':                                        MimeType{'iana', [], true, ''}
	'application/emergencycalldata.subscriberinfo+xml':                                     MimeType{'iana', [], true, ''}
	'application/emergencycalldata.veds+xml':                                               MimeType{'iana', [], true, ''}
	'application/emma+xml':                                                                 MimeType{'iana', [
		'emma',
	], true, ''}
	'application/emotionml+xml':                                                            MimeType{'iana', [], true, ''}
	'application/encaprtp':                                                                 MimeType{'iana', [], false, ''}
	'application/epp+xml':                                                                  MimeType{'iana', [], true, ''}
	'application/epub+zip':                                                                 MimeType{'iana', [
		'epub',
	], false, ''}
	'application/eshop':                                                                    MimeType{'iana', [], false, ''}
	'application/exi':                                                                      MimeType{'iana', [
		'exi',
	], false, ''}
	'application/expect-ct-report+json':                                                    MimeType{'iana', [], true, ''}
	'application/fastinfoset':                                                              MimeType{'iana', [], false, ''}
	'application/fastsoap':                                                                 MimeType{'iana', [], false, ''}
	'application/fdt+xml':                                                                  MimeType{'iana', [], true, ''}
	'application/fhir+json':                                                                MimeType{'iana', [], true, ''}
	'application/fhir+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/fido.trusted-apps+json':                                                   MimeType{'', [], true, ''}
	'application/fits':                                                                     MimeType{'iana', [], false, ''}
	'application/font-sfnt':                                                                MimeType{'iana', [], false, ''}
	'application/font-tdpfr':                                                               MimeType{'iana', [
		'pfr',
	], false, ''}
	'application/font-woff':                                                                MimeType{'iana', [], false, ''}
	'application/framework-attributes+xml':                                                 MimeType{'iana', [], true, ''}
	'application/geo+json':                                                                 MimeType{'iana', [
		'geojson',
	], true, ''}
	'application/geo+json-seq':                                                             MimeType{'iana', [], false, ''}
	'application/geopackage+sqlite3':                                                       MimeType{'iana', [], false, ''}
	'application/geoxacml+xml':                                                             MimeType{'iana', [], true, ''}
	'application/gltf-buffer':                                                              MimeType{'iana', [], false, ''}
	'application/gml+xml':                                                                  MimeType{'iana', [
		'gml',
	], true, ''}
	'application/gpx+xml':                                                                  MimeType{'apache', [
		'gpx',
	], true, ''}
	'application/gxf':                                                                      MimeType{'apache', [
		'gxf',
	], false, ''}
	'application/gzip':                                                                     MimeType{'iana', [
		'gz',
	], false, ''}
	'application/h224':                                                                     MimeType{'iana', [], false, ''}
	'application/held+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/hjson':                                                                    MimeType{'', [
		'hjson',
	], false, ''}
	'application/http':                                                                     MimeType{'iana', [], false, ''}
	'application/hyperstudio':                                                              MimeType{'iana', [
		'stk',
	], false, ''}
	'application/ibe-key-request+xml':                                                      MimeType{'iana', [], true, ''}
	'application/ibe-pkg-reply+xml':                                                        MimeType{'iana', [], true, ''}
	'application/ibe-pp-data':                                                              MimeType{'iana', [], false, ''}
	'application/iges':                                                                     MimeType{'iana', [], false, ''}
	'application/im-iscomposing+xml':                                                       MimeType{'iana', [], true, ''}
	'application/index':                                                                    MimeType{'iana', [], false, ''}
	'application/index.cmd':                                                                MimeType{'iana', [], false, ''}
	'application/index.obj':                                                                MimeType{'iana', [], false, ''}
	'application/index.response':                                                           MimeType{'iana', [], false, ''}
	'application/index.vnd':                                                                MimeType{'iana', [], false, ''}
	'application/inkml+xml':                                                                MimeType{'iana', [
		'ink',
		'inkml',
	], true, ''}
	'application/iotp':                                                                     MimeType{'iana', [], false, ''}
	'application/ipfix':                                                                    MimeType{'iana', [
		'ipfix',
	], false, ''}
	'application/ipp':                                                                      MimeType{'iana', [], false, ''}
	'application/isup':                                                                     MimeType{'iana', [], false, ''}
	'application/its+xml':                                                                  MimeType{'iana', [], true, ''}
	'application/java-archive':                                                             MimeType{'apache', [
		'jar',
		'war',
		'ear',
	], false, ''}
	'application/java-serialized-object':                                                   MimeType{'apache', [
		'ser',
	], false, ''}
	'application/java-vm':                                                                  MimeType{'apache', [
		'class',
	], false, ''}
	'application/javascript':                                                               MimeType{'iana', [
		'js',
		'mjs',
	], true, 'UTF-8'}
	'application/jf2feed+json':                                                             MimeType{'iana', [], true, ''}
	'application/jose':                                                                     MimeType{'iana', [], false, ''}
	'application/jose+json':                                                                MimeType{'iana', [], true, ''}
	'application/jrd+json':                                                                 MimeType{'iana', [], true, ''}
	'application/json':                                                                     MimeType{'iana', [
		'json',
		'map',
	], true, 'UTF-8'}
	'application/json-patch+json':                                                          MimeType{'iana', [], true, ''}
	'application/json-seq':                                                                 MimeType{'iana', [], false, ''}
	'application/json5':                                                                    MimeType{'', [
		'json5',
	], false, ''}
	'application/jsonml+json':                                                              MimeType{'apache', [
		'jsonml',
	], true, ''}
	'application/jwk+json':                                                                 MimeType{'iana', [], true, ''}
	'application/jwk-set+json':                                                             MimeType{'iana', [], true, ''}
	'application/jwt':                                                                      MimeType{'iana', [], false, ''}
	'application/kpml-request+xml':                                                         MimeType{'iana', [], true, ''}
	'application/kpml-response+xml':                                                        MimeType{'iana', [], true, ''}
	'application/ld+json':                                                                  MimeType{'iana', [
		'jsonld',
	], true, ''}
	'application/lgr+xml':                                                                  MimeType{'iana', [], true, ''}
	'application/link-format':                                                              MimeType{'iana', [], false, ''}
	'application/load-control+xml':                                                         MimeType{'iana', [], true, ''}
	'application/lost+xml':                                                                 MimeType{'iana', [
		'lostxml',
	], true, ''}
	'application/lostsync+xml':                                                             MimeType{'iana', [], true, ''}
	'application/lxf':                                                                      MimeType{'iana', [], false, ''}
	'application/mac-binhex40':                                                             MimeType{'iana', [
		'hqx',
	], false, ''}
	'application/mac-compactpro':                                                           MimeType{'apache', [
		'cpt',
	], false, ''}
	'application/macwriteii':                                                               MimeType{'iana', [], false, ''}
	'application/mads+xml':                                                                 MimeType{'iana', [
		'mads',
	], true, ''}
	'application/manifest+json':                                                            MimeType{'', [
		'webmanifest',
	], true, 'UTF-8'}
	'application/marc':                                                                     MimeType{'iana', [
		'mrc',
	], false, ''}
	'application/marcxml+xml':                                                              MimeType{'iana', [
		'mrcx',
	], true, ''}
	'application/mathematica':                                                              MimeType{'iana', [
		'ma',
		'nb',
		'mb',
	], false, ''}
	'application/mathml+xml':                                                               MimeType{'iana', [
		'mathml',
	], true, ''}
	'application/mathml-content+xml':                                                       MimeType{'iana', [], true, ''}
	'application/mathml-presentation+xml':                                                  MimeType{'iana', [], true, ''}
	'application/mbms-associated-procedure-description+xml':                                MimeType{'iana', [], true, ''}
	'application/mbms-deregister+xml':                                                      MimeType{'iana', [], true, ''}
	'application/mbms-envelope+xml':                                                        MimeType{'iana', [], true, ''}
	'application/mbms-msk+xml':                                                             MimeType{'iana', [], true, ''}
	'application/mbms-msk-response+xml':                                                    MimeType{'iana', [], true, ''}
	'application/mbms-protection-description+xml':                                          MimeType{'iana', [], true, ''}
	'application/mbms-reception-report+xml':                                                MimeType{'iana', [], true, ''}
	'application/mbms-register+xml':                                                        MimeType{'iana', [], true, ''}
	'application/mbms-register-response+xml':                                               MimeType{'iana', [], true, ''}
	'application/mbms-schedule+xml':                                                        MimeType{'iana', [], true, ''}
	'application/mbms-user-service-description+xml':                                        MimeType{'iana', [], true, ''}
	'application/mbox':                                                                     MimeType{'iana', [
		'mbox',
	], false, ''}
	'application/media-policy-dataset+xml':                                                 MimeType{'iana', [], true, ''}
	'application/media_control+xml':                                                        MimeType{'iana', [], true, ''}
	'application/mediaservercontrol+xml':                                                   MimeType{'iana', [
		'mscml',
	], true, ''}
	'application/merge-patch+json':                                                         MimeType{'iana', [], true, ''}
	'application/metalink+xml':                                                             MimeType{'apache', [
		'metalink',
	], true, ''}
	'application/metalink4+xml':                                                            MimeType{'iana', [
		'meta4',
	], true, ''}
	'application/mets+xml':                                                                 MimeType{'iana', [
		'mets',
	], true, ''}
	'application/mf4':                                                                      MimeType{'iana', [], false, ''}
	'application/mikey':                                                                    MimeType{'iana', [], false, ''}
	'application/mmt-aei+xml':                                                              MimeType{'iana', [], true, ''}
	'application/mmt-usd+xml':                                                              MimeType{'iana', [], true, ''}
	'application/mods+xml':                                                                 MimeType{'iana', [
		'mods',
	], true, ''}
	'application/moss-keys':                                                                MimeType{'iana', [], false, ''}
	'application/moss-signature':                                                           MimeType{'iana', [], false, ''}
	'application/mosskey-data':                                                             MimeType{'iana', [], false, ''}
	'application/mosskey-request':                                                          MimeType{'iana', [], false, ''}
	'application/mp21':                                                                     MimeType{'iana', [
		'm21',
		'mp21',
	], false, ''}
	'application/mp4':                                                                      MimeType{'iana', [
		'mp4s',
		'm4p',
	], false, ''}
	'application/mpeg4-generic':                                                            MimeType{'iana', [], false, ''}
	'application/mpeg4-iod':                                                                MimeType{'iana', [], false, ''}
	'application/mpeg4-iod-xmt':                                                            MimeType{'iana', [], false, ''}
	'application/mrb-consumer+xml':                                                         MimeType{'iana', [], true, ''}
	'application/mrb-publish+xml':                                                          MimeType{'iana', [], true, ''}
	'application/msc-ivr+xml':                                                              MimeType{'iana', [], true, ''}
	'application/msc-mixer+xml':                                                            MimeType{'iana', [], true, ''}
	'application/msword':                                                                   MimeType{'iana', [
		'doc',
		'dot',
	], false, ''}
	'application/mud+json':                                                                 MimeType{'iana', [], true, ''}
	'application/mxf':                                                                      MimeType{'iana', [
		'mxf',
	], false, ''}
	'application/n-quads':                                                                  MimeType{'iana', [
		'nq',
	], false, ''}
	'application/n-triples':                                                                MimeType{'iana', [
		'nt',
	], false, ''}
	'application/nasdata':                                                                  MimeType{'iana', [], false, ''}
	'application/news-checkgroups':                                                         MimeType{'iana', [], false, ''}
	'application/news-groupinfo':                                                           MimeType{'iana', [], false, ''}
	'application/news-transmission':                                                        MimeType{'iana', [], false, ''}
	'application/nlsml+xml':                                                                MimeType{'iana', [], true, ''}
	'application/node':                                                                     MimeType{'iana', [], false, ''}
	'application/nss':                                                                      MimeType{'iana', [], false, ''}
	'application/ocsp-request':                                                             MimeType{'iana', [], false, ''}
	'application/ocsp-response':                                                            MimeType{'iana', [], false, ''}
	'application/octet-stream':                                                             MimeType{'iana', [
		'bin',
		'dms',
		'lrf',
		'mar',
		'so',
		'dist',
		'distz',
		'pkg',
		'bpk',
		'dump',
		'elc',
		'deploy',
		'exe',
		'dll',
		'deb',
		'dmg',
		'iso',
		'img',
		'msi',
		'msp',
		'msm',
		'buffer',
	], false, ''}
	'application/oda':                                                                      MimeType{'iana', [
		'oda',
	], false, ''}
	'application/odm+xml':                                                                  MimeType{'iana', [], true, ''}
	'application/odx':                                                                      MimeType{'iana', [], false, ''}
	'application/oebps-package+xml':                                                        MimeType{'iana', [
		'opf',
	], true, ''}
	'application/ogg':                                                                      MimeType{'iana', [
		'ogx',
	], false, ''}
	'application/omdoc+xml':                                                                MimeType{'apache', [
		'omdoc',
	], true, ''}
	'application/onenote':                                                                  MimeType{'apache', [
		'onetoc',
		'onetoc2',
		'onetmp',
		'onepkg',
	], false, ''}
	'application/oscore':                                                                   MimeType{'iana', [], false, ''}
	'application/oxps':                                                                     MimeType{'iana', [
		'oxps',
	], false, ''}
	'application/p2p-overlay+xml':                                                          MimeType{'iana', [], true, ''}
	'application/parityfec':                                                                MimeType{'iana', [], false, ''}
	'application/passport':                                                                 MimeType{'iana', [], false, ''}
	'application/patch-ops-error+xml':                                                      MimeType{'iana', [
		'xer',
	], true, ''}
	'application/pdf':                                                                      MimeType{'iana', [
		'pdf',
	], false, ''}
	'application/pdx':                                                                      MimeType{'iana', [], false, ''}
	'application/pem-certificate-chain':                                                    MimeType{'iana', [], false, ''}
	'application/pgp-encrypted':                                                            MimeType{'iana', [
		'pgp',
	], false, ''}
	'application/pgp-keys':                                                                 MimeType{'iana', [], false, ''}
	'application/pgp-signature':                                                            MimeType{'iana', [
		'asc',
		'sig',
	], false, ''}
	'application/pics-rules':                                                               MimeType{'apache', [
		'prf',
	], false, ''}
	'application/pidf+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/pidf-diff+xml':                                                            MimeType{'iana', [], true, ''}
	'application/pkcs10':                                                                   MimeType{'iana', [
		'p10',
	], false, ''}
	'application/pkcs12':                                                                   MimeType{'iana', [], false, ''}
	'application/pkcs7-mime':                                                               MimeType{'iana', [
		'p7m',
		'p7c',
	], false, ''}
	'application/pkcs7-signature':                                                          MimeType{'iana', [
		'p7s',
	], false, ''}
	'application/pkcs8':                                                                    MimeType{'iana', [
		'p8',
	], false, ''}
	'application/pkcs8-encrypted':                                                          MimeType{'iana', [], false, ''}
	'application/pkix-attr-cert':                                                           MimeType{'iana', [
		'ac',
	], false, ''}
	'application/pkix-cert':                                                                MimeType{'iana', [
		'cer',
	], false, ''}
	'application/pkix-crl':                                                                 MimeType{'iana', [
		'crl',
	], false, ''}
	'application/pkix-pkipath':                                                             MimeType{'iana', [
		'pkipath',
	], false, ''}
	'application/pkixcmp':                                                                  MimeType{'iana', [
		'pki',
	], false, ''}
	'application/pls+xml':                                                                  MimeType{'iana', [
		'pls',
	], true, ''}
	'application/poc-settings+xml':                                                         MimeType{'iana', [], true, ''}
	'application/postscript':                                                               MimeType{'iana', [
		'ai',
		'eps',
		'ps',
	], true, ''}
	'application/ppsp-tracker+json':                                                        MimeType{'iana', [], true, ''}
	'application/problem+json':                                                             MimeType{'iana', [], true, ''}
	'application/problem+xml':                                                              MimeType{'iana', [], true, ''}
	'application/provenance+xml':                                                           MimeType{'iana', [], true, ''}
	'application/prs.alvestrand.titrax-sheet':                                              MimeType{'iana', [], false, ''}
	'application/prs.cww':                                                                  MimeType{'iana', [
		'cww',
	], false, ''}
	'application/prs.hpub+zip':                                                             MimeType{'iana', [], false, ''}
	'application/prs.nprend':                                                               MimeType{'iana', [], false, ''}
	'application/prs.plucker':                                                              MimeType{'iana', [], false, ''}
	'application/prs.rdf-xml-crypt':                                                        MimeType{'iana', [], false, ''}
	'application/prs.xsf+xml':                                                              MimeType{'iana', [], true, ''}
	'application/pskc+xml':                                                                 MimeType{'iana', [
		'pskcxml',
	], true, ''}
	'application/qsig':                                                                     MimeType{'iana', [], false, ''}
	'application/raml+yaml':                                                                MimeType{'', [
		'raml',
	], true, ''}
	'application/raptorfec':                                                                MimeType{'iana', [], false, ''}
	'application/rdap+json':                                                                MimeType{'iana', [], true, ''}
	'application/rdf+xml':                                                                  MimeType{'iana', [
		'rdf',
		'owl',
	], true, ''}
	'application/reginfo+xml':                                                              MimeType{'iana', [
		'rif',
	], true, ''}
	'application/relax-ng-compact-syntax':                                                  MimeType{'iana', [
		'rnc',
	], false, ''}
	'application/remote-printing':                                                          MimeType{'iana', [], false, ''}
	'application/reputon+json':                                                             MimeType{'iana', [], true, ''}
	'application/resource-lists+xml':                                                       MimeType{'iana', [
		'rl',
	], true, ''}
	'application/resource-lists-diff+xml':                                                  MimeType{'iana', [
		'rld',
	], true, ''}
	'application/rfc+xml':                                                                  MimeType{'iana', [], true, ''}
	'application/riscos':                                                                   MimeType{'iana', [], false, ''}
	'application/rlmi+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/rls-services+xml':                                                         MimeType{'iana', [
		'rs',
	], true, ''}
	'application/route-apd+xml':                                                            MimeType{'iana', [], true, ''}
	'application/route-s-tsid+xml':                                                         MimeType{'iana', [], true, ''}
	'application/route-usd+xml':                                                            MimeType{'iana', [], true, ''}
	'application/rpki-ghostbusters':                                                        MimeType{'iana', [
		'gbr',
	], false, ''}
	'application/rpki-manifest':                                                            MimeType{'iana', [
		'mft',
	], false, ''}
	'application/rpki-publication':                                                         MimeType{'iana', [], false, ''}
	'application/rpki-roa':                                                                 MimeType{'iana', [
		'roa',
	], false, ''}
	'application/rpki-updown':                                                              MimeType{'iana', [], false, ''}
	'application/rsd+xml':                                                                  MimeType{'apache', [
		'rsd',
	], true, ''}
	'application/rss+xml':                                                                  MimeType{'apache', [
		'rss',
	], true, ''}
	'application/rtf':                                                                      MimeType{'iana', [
		'rtf',
	], true, ''}
	'application/rtploopback':                                                              MimeType{'iana', [], false, ''}
	'application/rtx':                                                                      MimeType{'iana', [], false, ''}
	'application/samlassertion+xml':                                                        MimeType{'iana', [], true, ''}
	'application/samlmetadata+xml':                                                         MimeType{'iana', [], true, ''}
	'application/sbml+xml':                                                                 MimeType{'iana', [
		'sbml',
	], true, ''}
	'application/scaip+xml':                                                                MimeType{'iana', [], true, ''}
	'application/scim+json':                                                                MimeType{'iana', [], true, ''}
	'application/scvp-cv-request':                                                          MimeType{'iana', [
		'scq',
	], false, ''}
	'application/scvp-cv-response':                                                         MimeType{'iana', [
		'scs',
	], false, ''}
	'application/scvp-vp-request':                                                          MimeType{'iana', [
		'spq',
	], false, ''}
	'application/scvp-vp-response':                                                         MimeType{'iana', [
		'spp',
	], false, ''}
	'application/sdp':                                                                      MimeType{'iana', [
		'sdp',
	], false, ''}
	'application/secevent+jwt':                                                             MimeType{'iana', [], false, ''}
	'application/senml+cbor':                                                               MimeType{'iana', [], false, ''}
	'application/senml+json':                                                               MimeType{'iana', [], true, ''}
	'application/senml+xml':                                                                MimeType{'iana', [], true, ''}
	'application/senml-exi':                                                                MimeType{'iana', [], false, ''}
	'application/sensml+cbor':                                                              MimeType{'iana', [], false, ''}
	'application/sensml+json':                                                              MimeType{'iana', [], true, ''}
	'application/sensml+xml':                                                               MimeType{'iana', [], true, ''}
	'application/sensml-exi':                                                               MimeType{'iana', [], false, ''}
	'application/sep+xml':                                                                  MimeType{'iana', [], true, ''}
	'application/sep-exi':                                                                  MimeType{'iana', [], false, ''}
	'application/session-info':                                                             MimeType{'iana', [], false, ''}
	'application/set-payment':                                                              MimeType{'iana', [], false, ''}
	'application/set-payment-initiation':                                                   MimeType{'iana', [
		'setpay',
	], false, ''}
	'application/set-registration':                                                         MimeType{'iana', [], false, ''}
	'application/set-registration-initiation':                                              MimeType{'iana', [
		'setreg',
	], false, ''}
	'application/sgml':                                                                     MimeType{'iana', [], false, ''}
	'application/sgml-open-catalog':                                                        MimeType{'iana', [], false, ''}
	'application/shf+xml':                                                                  MimeType{'iana', [
		'shf',
	], true, ''}
	'application/sieve':                                                                    MimeType{'iana', [
		'siv',
		'sieve',
	], false, ''}
	'application/simple-filter+xml':                                                        MimeType{'iana', [], true, ''}
	'application/simple-message-summary':                                                   MimeType{'iana', [], false, ''}
	'application/simplesymbolcontainer':                                                    MimeType{'iana', [], false, ''}
	'application/slate':                                                                    MimeType{'iana', [], false, ''}
	'application/smil':                                                                     MimeType{'iana', [], false, ''}
	'application/smil+xml':                                                                 MimeType{'iana', [
		'smi',
		'smil',
	], true, ''}
	'application/smpte336m':                                                                MimeType{'iana', [], false, ''}
	'application/soap+fastinfoset':                                                         MimeType{'iana', [], false, ''}
	'application/soap+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/sparql-query':                                                             MimeType{'iana', [
		'rq',
	], false, ''}
	'application/sparql-results+xml':                                                       MimeType{'iana', [
		'srx',
	], true, ''}
	'application/spirits-event+xml':                                                        MimeType{'iana', [], true, ''}
	'application/sql':                                                                      MimeType{'iana', [], false, ''}
	'application/srgs':                                                                     MimeType{'iana', [
		'gram',
	], false, ''}
	'application/srgs+xml':                                                                 MimeType{'iana', [
		'grxml',
	], true, ''}
	'application/sru+xml':                                                                  MimeType{'iana', [
		'sru',
	], true, ''}
	'application/ssdl+xml':                                                                 MimeType{'apache', [
		'ssdl',
	], true, ''}
	'application/ssml+xml':                                                                 MimeType{'iana', [
		'ssml',
	], true, ''}
	'application/stix+json':                                                                MimeType{'iana', [], true, ''}
	'application/tamp-apex-update':                                                         MimeType{'iana', [], false, ''}
	'application/tamp-apex-update-confirm':                                                 MimeType{'iana', [], false, ''}
	'application/tamp-community-update':                                                    MimeType{'iana', [], false, ''}
	'application/tamp-community-update-confirm':                                            MimeType{'iana', [], false, ''}
	'application/tamp-error':                                                               MimeType{'iana', [], false, ''}
	'application/tamp-sequence-adjust':                                                     MimeType{'iana', [], false, ''}
	'application/tamp-sequence-adjust-confirm':                                             MimeType{'iana', [], false, ''}
	'application/tamp-status-query':                                                        MimeType{'iana', [], false, ''}
	'application/tamp-status-response':                                                     MimeType{'iana', [], false, ''}
	'application/tamp-update':                                                              MimeType{'iana', [], false, ''}
	'application/tamp-update-confirm':                                                      MimeType{'iana', [], false, ''}
	'application/tar':                                                                      MimeType{'', [], true, ''}
	'application/taxii+json':                                                               MimeType{'iana', [], true, ''}
	'application/tei+xml':                                                                  MimeType{'iana', [
		'tei',
		'teicorpus',
	], true, ''}
	'application/tetra_isi':                                                                MimeType{'iana', [], false, ''}
	'application/thraud+xml':                                                               MimeType{'iana', [
		'tfi',
	], true, ''}
	'application/timestamp-query':                                                          MimeType{'iana', [], false, ''}
	'application/timestamp-reply':                                                          MimeType{'iana', [], false, ''}
	'application/timestamped-data':                                                         MimeType{'iana', [
		'tsd',
	], false, ''}
	'application/tlsrpt+gzip':                                                              MimeType{'iana', [], false, ''}
	'application/tlsrpt+json':                                                              MimeType{'iana', [], true, ''}
	'application/tnauthlist':                                                               MimeType{'iana', [], false, ''}
	'application/trickle-ice-sdpfrag':                                                      MimeType{'iana', [], false, ''}
	'application/trig':                                                                     MimeType{'iana', [], false, ''}
	'application/ttml+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/tve-trigger':                                                              MimeType{'iana', [], false, ''}
	'application/tzif':                                                                     MimeType{'iana', [], false, ''}
	'application/tzif-leap':                                                                MimeType{'iana', [], false, ''}
	'application/ulpfec':                                                                   MimeType{'iana', [], false, ''}
	'application/urc-grpsheet+xml':                                                         MimeType{'iana', [], true, ''}
	'application/urc-ressheet+xml':                                                         MimeType{'iana', [], true, ''}
	'application/urc-targetdesc+xml':                                                       MimeType{'iana', [], true, ''}
	'application/urc-uisocketdesc+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vcard+json':                                                               MimeType{'iana', [], true, ''}
	'application/vcard+xml':                                                                MimeType{'iana', [], true, ''}
	'application/vemmi':                                                                    MimeType{'iana', [], false, ''}
	'application/vividence.scriptfile':                                                     MimeType{'apache', [], false, ''}
	'application/vnd.1000minds.decision-model+xml':                                         MimeType{'iana', [], true, ''}
	'application/vnd.3gpp-prose+xml':                                                       MimeType{'iana', [], true, ''}
	'application/vnd.3gpp-prose-pc3ch+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.3gpp-v2x-local-service-information':                                   MimeType{'iana', [], false, ''}
	'application/vnd.3gpp.access-transfer-events+xml':                                      MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.bsf+xml':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.gmop+xml':                                                        MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mc-signalling-ear':                                               MimeType{'iana', [], false, ''}
	'application/vnd.3gpp.mcdata-affiliation-command+xml':                                  MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcdata-info+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcdata-payload':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.3gpp.mcdata-service-config+xml':                                       MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcdata-signalling':                                               MimeType{'iana', [], false, ''}
	'application/vnd.3gpp.mcdata-ue-config+xml':                                            MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcdata-user-profile+xml':                                         MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-affiliation-command+xml':                                   MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-floor-request+xml':                                         MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-info+xml':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-location-info+xml':                                         MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-mbms-usage-info+xml':                                       MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-service-config+xml':                                        MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-signed+xml':                                                MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-ue-config+xml':                                             MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-ue-init-config+xml':                                        MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcptt-user-profile+xml':                                          MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcvideo-affiliation-command+xml':                                 MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcvideo-affiliation-info+xml':                                    MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcvideo-location-info+xml':                                       MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcvideo-mbms-usage-info+xml':                                     MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcvideo-service-config+xml':                                      MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcvideo-transmission-request+xml':                                MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcvideo-ue-config+xml':                                           MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mcvideo-user-profile+xml':                                        MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.mid-call+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.pic-bw-large':                                                    MimeType{'iana', [
		'plb',
	], false, ''}
	'application/vnd.3gpp.pic-bw-small':                                                    MimeType{'iana', [
		'psb',
	], false, ''}
	'application/vnd.3gpp.pic-bw-var':                                                      MimeType{'iana', [
		'pvb',
	], false, ''}
	'application/vnd.3gpp.sms':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.3gpp.sms+xml':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.srvcc-ext+xml':                                                   MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.srvcc-info+xml':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.state-and-event-info+xml':                                        MimeType{'iana', [], true, ''}
	'application/vnd.3gpp.ussd+xml':                                                        MimeType{'iana', [], true, ''}
	'application/vnd.3gpp2.bcmcsinfo+xml':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.3gpp2.sms':                                                            MimeType{'iana', [], false, ''}
	'application/vnd.3gpp2.tcap':                                                           MimeType{'iana', [
		'tcap',
	], false, ''}
	'application/vnd.3lightssoftware.imagescal':                                            MimeType{'iana', [], false, ''}
	'application/vnd.3m.post-it-notes':                                                     MimeType{'iana', [
		'pwn',
	], false, ''}
	'application/vnd.accpac.simply.aso':                                                    MimeType{'iana', [
		'aso',
	], false, ''}
	'application/vnd.accpac.simply.imp':                                                    MimeType{'iana', [
		'imp',
	], false, ''}
	'application/vnd.acucobol':                                                             MimeType{'iana', [
		'acu',
	], false, ''}
	'application/vnd.acucorp':                                                              MimeType{'iana', [
		'atc',
		'acutc',
	], false, ''}
	'application/vnd.adobe.air-application-installer-package+zip':                          MimeType{'apache', [
		'air',
	], false, ''}
	'application/vnd.adobe.flash.movie':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.adobe.formscentral.fcdt':                                              MimeType{'iana', [
		'fcdt',
	], false, ''}
	'application/vnd.adobe.fxp':                                                            MimeType{'iana', [
		'fxp',
		'fxpl',
	], false, ''}
	'application/vnd.adobe.partial-upload':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.adobe.xdp+xml':                                                        MimeType{'iana', [
		'xdp',
	], true, ''}
	'application/vnd.adobe.xfdf':                                                           MimeType{'iana', [
		'xfdf',
	], false, ''}
	'application/vnd.aether.imp':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.afpc.afplinedata':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.afpc.modca':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.ah-barcode':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.ahead.space':                                                          MimeType{'iana', [
		'ahead',
	], false, ''}
	'application/vnd.airzip.filesecure.azf':                                                MimeType{'iana', [
		'azf',
	], false, ''}
	'application/vnd.airzip.filesecure.azs':                                                MimeType{'iana', [
		'azs',
	], false, ''}
	'application/vnd.amadeus+json':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.amazon.ebook':                                                         MimeType{'apache', [
		'azw',
	], false, ''}
	'application/vnd.amazon.mobi8-ebook':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.americandynamics.acc':                                                 MimeType{'iana', [
		'acc',
	], false, ''}
	'application/vnd.amiga.ami':                                                            MimeType{'iana', [
		'ami',
	], false, ''}
	'application/vnd.amundsen.maze+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.android.package-archive':                                              MimeType{'apache', [
		'apk',
	], false, ''}
	'application/vnd.anki':                                                                 MimeType{'iana', [], false, ''}
	'application/vnd.anser-web-certificate-issue-initiation':                               MimeType{'iana', [
		'cii',
	], false, ''}
	'application/vnd.anser-web-funds-transfer-initiation':                                  MimeType{'apache', [
		'fti',
	], false, ''}
	'application/vnd.antix.game-component':                                                 MimeType{'iana', [
		'atx',
	], false, ''}
	'application/vnd.apache.thrift.binary':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.apache.thrift.compact':                                                MimeType{'iana', [], false, ''}
	'application/vnd.apache.thrift.json':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.api+json':                                                             MimeType{'iana', [], true, ''}
	'application/vnd.apothekende.reservation+json':                                         MimeType{'iana', [], true, ''}
	'application/vnd.apple.installer+xml':                                                  MimeType{'iana', [
		'mpkg',
	], true, ''}
	'application/vnd.apple.keynote':                                                        MimeType{'iana', [
		'keynote',
	], false, ''}
	'application/vnd.apple.mpegurl':                                                        MimeType{'iana', [
		'm3u8',
	], false, ''}
	'application/vnd.apple.numbers':                                                        MimeType{'iana', [
		'numbers',
	], false, ''}
	'application/vnd.apple.pages':                                                          MimeType{'iana', [
		'pages',
	], false, ''}
	'application/vnd.apple.pkpass':                                                         MimeType{'', [
		'pkpass',
	], false, ''}
	'application/vnd.arastra.swi':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.aristanetworks.swi':                                                   MimeType{'iana', [
		'swi',
	], false, ''}
	'application/vnd.artisan+json':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.artsquare':                                                            MimeType{'iana', [], false, ''}
	'application/vnd.astraea-software.iota':                                                MimeType{'iana', [
		'iota',
	], false, ''}
	'application/vnd.audiograph':                                                           MimeType{'iana', [
		'aep',
	], false, ''}
	'application/vnd.autopackage':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.avalon+json':                                                          MimeType{'iana', [], true, ''}
	'application/vnd.avistar+xml':                                                          MimeType{'iana', [], true, ''}
	'application/vnd.balsamiq.bmml+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.balsamiq.bmpr':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.banana-accounting':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.bbf.usp.msg':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.bbf.usp.msg+json':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.bekitzur-stech+json':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.bint.med-content':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.biopax.rdf+xml':                                                       MimeType{'iana', [], true, ''}
	'application/vnd.blink-idb-value-wrapper':                                              MimeType{'iana', [], false, ''}
	'application/vnd.blueice.multipass':                                                    MimeType{'iana', [
		'mpm',
	], false, ''}
	'application/vnd.bluetooth.ep.oob':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.bluetooth.le.oob':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.bmi':                                                                  MimeType{'iana', [
		'bmi',
	], false, ''}
	'application/vnd.businessobjects':                                                      MimeType{'iana', [
		'rep',
	], false, ''}
	'application/vnd.byu.uapi+json':                                                        MimeType{'iana', [], true, ''}
	'application/vnd.cab-jscript':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.canon-cpdl':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.canon-lips':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.capasystems-pg+json':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.cendio.thinlinc.clientconf':                                           MimeType{'iana', [], false, ''}
	'application/vnd.century-systems.tcp_stream':                                           MimeType{'iana', [], false, ''}
	'application/vnd.chemdraw+xml':                                                         MimeType{'iana', [
		'cdxml',
	], true, ''}
	'application/vnd.chess-pgn':                                                            MimeType{'iana', [], false, ''}
	'application/vnd.chipnuts.karaoke-mmd':                                                 MimeType{'iana', [
		'mmd',
	], false, ''}
	'application/vnd.cinderella':                                                           MimeType{'iana', [
		'cdy',
	], false, ''}
	'application/vnd.cirpack.isdn-ext':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.citationstyles.style+xml':                                             MimeType{'iana', [
		'csl',
	], true, ''}
	'application/vnd.claymore':                                                             MimeType{'iana', [
		'cla',
	], false, ''}
	'application/vnd.cloanto.rp9':                                                          MimeType{'iana', [
		'rp9',
	], false, ''}
	'application/vnd.clonk.c4group':                                                        MimeType{'iana', [
		'c4g',
		'c4d',
		'c4f',
		'c4p',
		'c4u',
	], false, ''}
	'application/vnd.cluetrust.cartomobile-config':                                         MimeType{'iana', [
		'c11amc',
	], false, ''}
	'application/vnd.cluetrust.cartomobile-config-pkg':                                     MimeType{'iana', [
		'c11amz',
	], false, ''}
	'application/vnd.coffeescript':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.collabio.xodocuments.document':                                        MimeType{'iana', [], false, ''}
	'application/vnd.collabio.xodocuments.document-template':                               MimeType{'iana', [], false, ''}
	'application/vnd.collabio.xodocuments.presentation':                                    MimeType{'iana', [], false, ''}
	'application/vnd.collabio.xodocuments.presentation-template':                           MimeType{'iana', [], false, ''}
	'application/vnd.collabio.xodocuments.spreadsheet':                                     MimeType{'iana', [], false, ''}
	'application/vnd.collabio.xodocuments.spreadsheet-template':                            MimeType{'iana', [], false, ''}
	'application/vnd.collection+json':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.collection.doc+json':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.collection.next+json':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.comicbook+zip':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.comicbook-rar':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.commerce-battelle':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.commonspace':                                                          MimeType{'iana', [
		'csp',
	], false, ''}
	'application/vnd.contact.cmsg':                                                         MimeType{'iana', [
		'cdbcmsg',
	], false, ''}
	'application/vnd.coreos.ignition+json':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.cosmocaller':                                                          MimeType{'iana', [
		'cmc',
	], false, ''}
	'application/vnd.crick.clicker':                                                        MimeType{'iana', [
		'clkx',
	], false, ''}
	'application/vnd.crick.clicker.keyboard':                                               MimeType{'iana', [
		'clkk',
	], false, ''}
	'application/vnd.crick.clicker.palette':                                                MimeType{'iana', [
		'clkp',
	], false, ''}
	'application/vnd.crick.clicker.template':                                               MimeType{'iana', [
		'clkt',
	], false, ''}
	'application/vnd.crick.clicker.wordbank':                                               MimeType{'iana', [
		'clkw',
	], false, ''}
	'application/vnd.criticaltools.wbs+xml':                                                MimeType{'iana', [
		'wbs',
	], true, ''}
	'application/vnd.ctc-posml':                                                            MimeType{'iana', [
		'pml',
	], false, ''}
	'application/vnd.ctct.ws+xml':                                                          MimeType{'iana', [], true, ''}
	'application/vnd.cups-pdf':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.cups-postscript':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.cups-ppd':                                                             MimeType{'iana', [
		'ppd',
	], false, ''}
	'application/vnd.cups-raster':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.cups-raw':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.curl':                                                                 MimeType{'iana', [], false, ''}
	'application/vnd.curl.car':                                                             MimeType{'apache', [
		'car',
	], false, ''}
	'application/vnd.curl.pcurl':                                                           MimeType{'apache', [
		'pcurl',
	], false, ''}
	'application/vnd.cyan.dean.root+xml':                                                   MimeType{'iana', [], true, ''}
	'application/vnd.cybank':                                                               MimeType{'iana', [], false, ''}
	'application/vnd.d2l.coursepackage1p0+zip':                                             MimeType{'iana', [], false, ''}
	'application/vnd.dart':                                                                 MimeType{'iana', [
		'dart',
	], true, ''}
	'application/vnd.data-vision.rdz':                                                      MimeType{'iana', [
		'rdz',
	], false, ''}
	'application/vnd.datapackage+json':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.dataresource+json':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.debian.binary-package':                                                MimeType{'iana', [], false, ''}
	'application/vnd.dece.data':                                                            MimeType{'iana', [
		'uvf',
		'uvvf',
		'uvd',
		'uvvd',
	], false, ''}
	'application/vnd.dece.ttml+xml':                                                        MimeType{'iana', [
		'uvt',
		'uvvt',
	], true, ''}
	'application/vnd.dece.unspecified':                                                     MimeType{'iana', [
		'uvx',
		'uvvx',
	], false, ''}
	'application/vnd.dece.zip':                                                             MimeType{'iana', [
		'uvz',
		'uvvz',
	], false, ''}
	'application/vnd.denovo.fcselayout-link':                                               MimeType{'iana', [
		'fe_launch',
	], false, ''}
	'application/vnd.desmume.movie':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.dir-bi.plate-dl-nosuffix':                                             MimeType{'iana', [], false, ''}
	'application/vnd.dm.delegation+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.dna':                                                                  MimeType{'iana', [
		'dna',
	], false, ''}
	'application/vnd.document+json':                                                        MimeType{'iana', [], true, ''}
	'application/vnd.dolby.mlp':                                                            MimeType{'apache', [
		'mlp',
	], false, ''}
	'application/vnd.dolby.mobile.1':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.dolby.mobile.2':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.doremir.scorecloud-binary-document':                                   MimeType{'iana', [], false, ''}
	'application/vnd.dpgraph':                                                              MimeType{'iana', [
		'dpg',
	], false, ''}
	'application/vnd.dreamfactory':                                                         MimeType{'iana', [
		'dfac',
	], false, ''}
	'application/vnd.drive+json':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.ds-keypoint':                                                          MimeType{'apache', [
		'kpxx',
	], false, ''}
	'application/vnd.dtg.local':                                                            MimeType{'iana', [], false, ''}
	'application/vnd.dtg.local.flash':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.dtg.local.html':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.dvb.ait':                                                              MimeType{'iana', [
		'ait',
	], false, ''}
	'application/vnd.dvb.dvbj':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.dvb.esgcontainer':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.dvb.ipdcdftnotifaccess':                                               MimeType{'iana', [], false, ''}
	'application/vnd.dvb.ipdcesgaccess':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.dvb.ipdcesgaccess2':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.dvb.ipdcesgpdd':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.dvb.ipdcroaming':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.dvb.iptv.alfec-base':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.dvb.iptv.alfec-enhancement':                                           MimeType{'iana', [], false, ''}
	'application/vnd.dvb.notif-aggregate-root+xml':                                         MimeType{'iana', [], true, ''}
	'application/vnd.dvb.notif-container+xml':                                              MimeType{'iana', [], true, ''}
	'application/vnd.dvb.notif-generic+xml':                                                MimeType{'iana', [], true, ''}
	'application/vnd.dvb.notif-ia-msglist+xml':                                             MimeType{'iana', [], true, ''}
	'application/vnd.dvb.notif-ia-registration-request+xml':                                MimeType{'iana', [], true, ''}
	'application/vnd.dvb.notif-ia-registration-response+xml':                               MimeType{'iana', [], true, ''}
	'application/vnd.dvb.notif-init+xml':                                                   MimeType{'iana', [], true, ''}
	'application/vnd.dvb.pfr':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.dvb.service':                                                          MimeType{'iana', [
		'svc',
	], false, ''}
	'application/vnd.dxr':                                                                  MimeType{'iana', [], false, ''}
	'application/vnd.dynageo':                                                              MimeType{'iana', [
		'geo',
	], false, ''}
	'application/vnd.dzr':                                                                  MimeType{'iana', [], false, ''}
	'application/vnd.easykaraoke.cdgdownload':                                              MimeType{'iana', [], false, ''}
	'application/vnd.ecdis-update':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.ecip.rlp':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.ecowin.chart':                                                         MimeType{'iana', [
		'mag',
	], false, ''}
	'application/vnd.ecowin.filerequest':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.ecowin.fileupdate':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.ecowin.series':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.ecowin.seriesrequest':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.ecowin.seriesupdate':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.efi.img':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.efi.iso':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.emclient.accessrequest+xml':                                           MimeType{'iana', [], true, ''}
	'application/vnd.enliven':                                                              MimeType{'iana', [
		'nml',
	], false, ''}
	'application/vnd.enphase.envoy':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.eprints.data+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.epson.esf':                                                            MimeType{'iana', [
		'esf',
	], false, ''}
	'application/vnd.epson.msf':                                                            MimeType{'iana', [
		'msf',
	], false, ''}
	'application/vnd.epson.quickanime':                                                     MimeType{'iana', [
		'qam',
	], false, ''}
	'application/vnd.epson.salt':                                                           MimeType{'iana', [
		'slt',
	], false, ''}
	'application/vnd.epson.ssf':                                                            MimeType{'iana', [
		'ssf',
	], false, ''}
	'application/vnd.ericsson.quickcall':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.espass-espass+zip':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.eszigno3+xml':                                                         MimeType{'iana', [
		'es3',
		'et3',
	], true, ''}
	'application/vnd.etsi.aoc+xml':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.etsi.asic-e+zip':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.etsi.asic-s+zip':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.etsi.cug+xml':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvcommand+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvdiscovery+xml':                                               MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvprofile+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvsad-bc+xml':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvsad-cod+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvsad-npvr+xml':                                                MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvservice+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvsync+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.etsi.iptvueprofile+xml':                                               MimeType{'iana', [], true, ''}
	'application/vnd.etsi.mcid+xml':                                                        MimeType{'iana', [], true, ''}
	'application/vnd.etsi.mheg5':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.etsi.overload-control-policy-dataset+xml':                             MimeType{'iana', [], true, ''}
	'application/vnd.etsi.pstn+xml':                                                        MimeType{'iana', [], true, ''}
	'application/vnd.etsi.sci+xml':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.etsi.simservs+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.etsi.timestamp-token':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.etsi.tsl+xml':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.etsi.tsl.der':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.eudora.data':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.evolv.ecig.profile':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.evolv.ecig.settings':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.evolv.ecig.theme':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.exstream-empower+zip':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.exstream-package':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.ezpix-album':                                                          MimeType{'iana', [
		'ez2',
	], false, ''}
	'application/vnd.ezpix-package':                                                        MimeType{'iana', [
		'ez3',
	], false, ''}
	'application/vnd.f-secure.mobile':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.fastcopy-disk-image':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.fdf':                                                                  MimeType{'iana', [
		'fdf',
	], false, ''}
	'application/vnd.fdsn.mseed':                                                           MimeType{'iana', [
		'mseed',
	], false, ''}
	'application/vnd.fdsn.seed':                                                            MimeType{'iana', [
		'seed',
		'dataless',
	], false, ''}
	'application/vnd.ffsns':                                                                MimeType{'iana', [], false, ''}
	'application/vnd.filmit.zfc':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.fints':                                                                MimeType{'iana', [], false, ''}
	'application/vnd.firemonkeys.cloudcell':                                                MimeType{'iana', [], false, ''}
	'application/vnd.flographit':                                                           MimeType{'iana', [
		'gph',
	], false, ''}
	'application/vnd.fluxtime.clip':                                                        MimeType{'iana', [
		'ftc',
	], false, ''}
	'application/vnd.font-fontforge-sfd':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.framemaker':                                                           MimeType{'iana', [
		'fm',
		'frame',
		'maker',
		'book',
	], false, ''}
	'application/vnd.frogans.fnc':                                                          MimeType{'iana', [
		'fnc',
	], false, ''}
	'application/vnd.frogans.ltf':                                                          MimeType{'iana', [
		'ltf',
	], false, ''}
	'application/vnd.fsc.weblaunch':                                                        MimeType{'iana', [
		'fsc',
	], false, ''}
	'application/vnd.fujitsu.oasys':                                                        MimeType{'iana', [
		'oas',
	], false, ''}
	'application/vnd.fujitsu.oasys2':                                                       MimeType{'iana', [
		'oa2',
	], false, ''}
	'application/vnd.fujitsu.oasys3':                                                       MimeType{'iana', [
		'oa3',
	], false, ''}
	'application/vnd.fujitsu.oasysgp':                                                      MimeType{'iana', [
		'fg5',
	], false, ''}
	'application/vnd.fujitsu.oasysprs':                                                     MimeType{'iana', [
		'bh2',
	], false, ''}
	'application/vnd.fujixerox.art-ex':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.fujixerox.art4':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.fujixerox.ddd':                                                        MimeType{'iana', [
		'ddd',
	], false, ''}
	'application/vnd.fujixerox.docuworks':                                                  MimeType{'iana', [
		'xdw',
	], false, ''}
	'application/vnd.fujixerox.docuworks.binder':                                           MimeType{'iana', [
		'xbd',
	], false, ''}
	'application/vnd.fujixerox.docuworks.container':                                        MimeType{'iana', [], false, ''}
	'application/vnd.fujixerox.hbpl':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.fut-misnet':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.futoin+cbor':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.futoin+json':                                                          MimeType{'iana', [], true, ''}
	'application/vnd.fuzzysheet':                                                           MimeType{'iana', [
		'fzs',
	], false, ''}
	'application/vnd.genomatix.tuxedo':                                                     MimeType{'iana', [
		'txd',
	], false, ''}
	'application/vnd.geo+json':                                                             MimeType{'iana', [], true, ''}
	'application/vnd.geocube+xml':                                                          MimeType{'iana', [], true, ''}
	'application/vnd.geogebra.file':                                                        MimeType{'iana', [
		'ggb',
	], false, ''}
	'application/vnd.geogebra.tool':                                                        MimeType{'iana', [
		'ggt',
	], false, ''}
	'application/vnd.geometry-explorer':                                                    MimeType{'iana', [
		'gex',
		'gre',
	], false, ''}
	'application/vnd.geonext':                                                              MimeType{'iana', [
		'gxt',
	], false, ''}
	'application/vnd.geoplan':                                                              MimeType{'iana', [
		'g2w',
	], false, ''}
	'application/vnd.geospace':                                                             MimeType{'iana', [
		'g3w',
	], false, ''}
	'application/vnd.gerber':                                                               MimeType{'iana', [], false, ''}
	'application/vnd.globalplatform.card-content-mgt':                                      MimeType{'iana', [], false, ''}
	'application/vnd.globalplatform.card-content-mgt-response':                             MimeType{'iana', [], false, ''}
	'application/vnd.gmx':                                                                  MimeType{'iana', [
		'gmx',
	], false, ''}
	'application/vnd.google-apps.document':                                                 MimeType{'', [
		'gdoc',
	], false, ''}
	'application/vnd.google-apps.presentation':                                             MimeType{'', [
		'gslides',
	], false, ''}
	'application/vnd.google-apps.spreadsheet':                                              MimeType{'', [
		'gsheet',
	], false, ''}
	'application/vnd.google-earth.kml+xml':                                                 MimeType{'iana', [
		'kml',
	], true, ''}
	'application/vnd.google-earth.kmz':                                                     MimeType{'iana', [
		'kmz',
	], false, ''}
	'application/vnd.gov.sk.e-form+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.gov.sk.e-form+zip':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.gov.sk.xmldatacontainer+xml':                                          MimeType{'iana', [], true, ''}
	'application/vnd.grafeq':                                                               MimeType{'iana', [
		'gqf',
		'gqs',
	], false, ''}
	'application/vnd.gridmp':                                                               MimeType{'iana', [], false, ''}
	'application/vnd.groove-account':                                                       MimeType{'iana', [
		'gac',
	], false, ''}
	'application/vnd.groove-help':                                                          MimeType{'iana', [
		'ghf',
	], false, ''}
	'application/vnd.groove-identity-message':                                              MimeType{'iana', [
		'gim',
	], false, ''}
	'application/vnd.groove-injector':                                                      MimeType{'iana', [
		'grv',
	], false, ''}
	'application/vnd.groove-tool-message':                                                  MimeType{'iana', [
		'gtm',
	], false, ''}
	'application/vnd.groove-tool-template':                                                 MimeType{'iana', [
		'tpl',
	], false, ''}
	'application/vnd.groove-vcard':                                                         MimeType{'iana', [
		'vcg',
	], false, ''}
	'application/vnd.hal+json':                                                             MimeType{'iana', [], true, ''}
	'application/vnd.hal+xml':                                                              MimeType{'iana', [
		'hal',
	], true, ''}
	'application/vnd.handheld-entertainment+xml':                                           MimeType{'iana', [
		'zmm',
	], true, ''}
	'application/vnd.hbci':                                                                 MimeType{'iana', [
		'hbci',
	], false, ''}
	'application/vnd.hc+json':                                                              MimeType{'iana', [], true, ''}
	'application/vnd.hcl-bireports':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.hdt':                                                                  MimeType{'iana', [], false, ''}
	'application/vnd.heroku+json':                                                          MimeType{'iana', [], true, ''}
	'application/vnd.hhe.lesson-player':                                                    MimeType{'iana', [
		'les',
	], false, ''}
	'application/vnd.hp-hpgl':                                                              MimeType{'iana', [
		'hpgl',
	], false, ''}
	'application/vnd.hp-hpid':                                                              MimeType{'iana', [
		'hpid',
	], false, ''}
	'application/vnd.hp-hps':                                                               MimeType{'iana', [
		'hps',
	], false, ''}
	'application/vnd.hp-jlyt':                                                              MimeType{'iana', [
		'jlt',
	], false, ''}
	'application/vnd.hp-pcl':                                                               MimeType{'iana', [
		'pcl',
	], false, ''}
	'application/vnd.hp-pclxl':                                                             MimeType{'iana', [
		'pclxl',
	], false, ''}
	'application/vnd.httphone':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.hydrostatix.sof-data':                                                 MimeType{'iana', [
		'sfd-hdstx',
	], false, ''}
	'application/vnd.hyper+json':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.hyper-item+json':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.hyperdrive+json':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.hzn-3d-crossword':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.ibm.afplinedata':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.ibm.electronic-media':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.ibm.minipay':                                                          MimeType{'iana', [
		'mpy',
	], false, ''}
	'application/vnd.ibm.modcap':                                                           MimeType{'iana', [
		'afp',
		'listafp',
		'list3820',
	], false, ''}
	'application/vnd.ibm.rights-management':                                                MimeType{'iana', [
		'irm',
	], false, ''}
	'application/vnd.ibm.secure-container':                                                 MimeType{'iana', [
		'sc',
	], false, ''}
	'application/vnd.iccprofile':                                                           MimeType{'iana', [
		'icc',
		'icm',
	], false, ''}
	'application/vnd.ieee.1905':                                                            MimeType{'iana', [], false, ''}
	'application/vnd.igloader':                                                             MimeType{'iana', [
		'igl',
	], false, ''}
	'application/vnd.imagemeter.folder+zip':                                                MimeType{'iana', [], false, ''}
	'application/vnd.imagemeter.image+zip':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.immervision-ivp':                                                      MimeType{'iana', [
		'ivp',
	], false, ''}
	'application/vnd.immervision-ivu':                                                      MimeType{'iana', [
		'ivu',
	], false, ''}
	'application/vnd.ims.imsccv1p1':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.ims.imsccv1p2':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.ims.imsccv1p3':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.ims.lis.v2.result+json':                                               MimeType{'iana', [], true, ''}
	'application/vnd.ims.lti.v2.toolconsumerprofile+json':                                  MimeType{'iana', [], true, ''}
	'application/vnd.ims.lti.v2.toolproxy+json':                                            MimeType{'iana', [], true, ''}
	'application/vnd.ims.lti.v2.toolproxy.id+json':                                         MimeType{'iana', [], true, ''}
	'application/vnd.ims.lti.v2.toolsettings+json':                                         MimeType{'iana', [], true, ''}
	'application/vnd.ims.lti.v2.toolsettings.simple+json':                                  MimeType{'iana', [], true, ''}
	'application/vnd.informedcontrol.rms+xml':                                              MimeType{'iana', [], true, ''}
	'application/vnd.informix-visionary':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.infotech.project':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.infotech.project+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.innopath.wamp.notification':                                           MimeType{'iana', [], false, ''}
	'application/vnd.insors.igm':                                                           MimeType{'iana', [
		'igm',
	], false, ''}
	'application/vnd.intercon.formnet':                                                     MimeType{'iana', [
		'xpw',
		'xpx',
	], false, ''}
	'application/vnd.intergeo':                                                             MimeType{'iana', [
		'i2g',
	], false, ''}
	'application/vnd.intertrust.digibox':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.intertrust.nncp':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.intu.qbo':                                                             MimeType{'iana', [
		'qbo',
	], false, ''}
	'application/vnd.intu.qfx':                                                             MimeType{'iana', [
		'qfx',
	], false, ''}
	'application/vnd.iptc.g2.catalogitem+xml':                                              MimeType{'iana', [], true, ''}
	'application/vnd.iptc.g2.conceptitem+xml':                                              MimeType{'iana', [], true, ''}
	'application/vnd.iptc.g2.knowledgeitem+xml':                                            MimeType{'iana', [], true, ''}
	'application/vnd.iptc.g2.newsitem+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.iptc.g2.newsmessage+xml':                                              MimeType{'iana', [], true, ''}
	'application/vnd.iptc.g2.packageitem+xml':                                              MimeType{'iana', [], true, ''}
	'application/vnd.iptc.g2.planningitem+xml':                                             MimeType{'iana', [], true, ''}
	'application/vnd.ipunplugged.rcprofile':                                                MimeType{'iana', [
		'rcprofile',
	], false, ''}
	'application/vnd.irepository.package+xml':                                              MimeType{'iana', [
		'irp',
	], true, ''}
	'application/vnd.is-xpr':                                                               MimeType{'iana', [
		'xpr',
	], false, ''}
	'application/vnd.isac.fcs':                                                             MimeType{'iana', [
		'fcs',
	], false, ''}
	'application/vnd.jam':                                                                  MimeType{'iana', [
		'jam',
	], false, ''}
	'application/vnd.japannet-directory-service':                                           MimeType{'iana', [], false, ''}
	'application/vnd.japannet-jpnstore-wakeup':                                             MimeType{'iana', [], false, ''}
	'application/vnd.japannet-payment-wakeup':                                              MimeType{'iana', [], false, ''}
	'application/vnd.japannet-registration':                                                MimeType{'iana', [], false, ''}
	'application/vnd.japannet-registration-wakeup':                                         MimeType{'iana', [], false, ''}
	'application/vnd.japannet-setstore-wakeup':                                             MimeType{'iana', [], false, ''}
	'application/vnd.japannet-verification':                                                MimeType{'iana', [], false, ''}
	'application/vnd.japannet-verification-wakeup':                                         MimeType{'iana', [], false, ''}
	'application/vnd.jcp.javame.midlet-rms':                                                MimeType{'iana', [
		'rms',
	], false, ''}
	'application/vnd.jisp':                                                                 MimeType{'iana', [
		'jisp',
	], false, ''}
	'application/vnd.joost.joda-archive':                                                   MimeType{'iana', [
		'joda',
	], false, ''}
	'application/vnd.jsk.isdn-ngn':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.kahootz':                                                              MimeType{'iana', [
		'ktz',
		'ktr',
	], false, ''}
	'application/vnd.kde.karbon':                                                           MimeType{'iana', [
		'karbon',
	], false, ''}
	'application/vnd.kde.kchart':                                                           MimeType{'iana', [
		'chrt',
	], false, ''}
	'application/vnd.kde.kformula':                                                         MimeType{'iana', [
		'kfo',
	], false, ''}
	'application/vnd.kde.kivio':                                                            MimeType{'iana', [
		'flw',
	], false, ''}
	'application/vnd.kde.kontour':                                                          MimeType{'iana', [
		'kon',
	], false, ''}
	'application/vnd.kde.kpresenter':                                                       MimeType{'iana', [
		'kpr',
		'kpt',
	], false, ''}
	'application/vnd.kde.kspread':                                                          MimeType{'iana', [
		'ksp',
	], false, ''}
	'application/vnd.kde.kword':                                                            MimeType{'iana', [
		'kwd',
		'kwt',
	], false, ''}
	'application/vnd.kenameaapp':                                                           MimeType{'iana', [
		'htke',
	], false, ''}
	'application/vnd.kidspiration':                                                         MimeType{'iana', [
		'kia',
	], false, ''}
	'application/vnd.kinar':                                                                MimeType{'iana', [
		'kne',
		'knp',
	], false, ''}
	'application/vnd.koan':                                                                 MimeType{'iana', [
		'skp',
		'skd',
		'skt',
		'skm',
	], false, ''}
	'application/vnd.kodak-descriptor':                                                     MimeType{'iana', [
		'sse',
	], false, ''}
	'application/vnd.las.las+json':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.las.las+xml':                                                          MimeType{'iana', [
		'lasxml',
	], true, ''}
	'application/vnd.leap+json':                                                            MimeType{'iana', [], true, ''}
	'application/vnd.liberty-request+xml':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.llamagraphics.life-balance.desktop':                                   MimeType{'iana', [
		'lbd',
	], false, ''}
	'application/vnd.llamagraphics.life-balance.exchange+xml':                              MimeType{'iana', [
		'lbe',
	], true, ''}
	'application/vnd.lotus-1-2-3':                                                          MimeType{'iana', [
		'123',
	], false, ''}
	'application/vnd.lotus-approach':                                                       MimeType{'iana', [
		'apr',
	], false, ''}
	'application/vnd.lotus-freelance':                                                      MimeType{'iana', [
		'pre',
	], false, ''}
	'application/vnd.lotus-notes':                                                          MimeType{'iana', [
		'nsf',
	], false, ''}
	'application/vnd.lotus-organizer':                                                      MimeType{'iana', [
		'org',
	], false, ''}
	'application/vnd.lotus-screencam':                                                      MimeType{'iana', [
		'scm',
	], false, ''}
	'application/vnd.lotus-wordpro':                                                        MimeType{'iana', [
		'lwp',
	], false, ''}
	'application/vnd.macports.portpkg':                                                     MimeType{'iana', [
		'portpkg',
	], false, ''}
	'application/vnd.mapbox-vector-tile':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.marlin.drm.actiontoken+xml':                                           MimeType{'iana', [], true, ''}
	'application/vnd.marlin.drm.conftoken+xml':                                             MimeType{'iana', [], true, ''}
	'application/vnd.marlin.drm.license+xml':                                               MimeType{'iana', [], true, ''}
	'application/vnd.marlin.drm.mdcf':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.mason+json':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.maxmind.maxmind-db':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.mcd':                                                                  MimeType{'iana', [
		'mcd',
	], false, ''}
	'application/vnd.medcalcdata':                                                          MimeType{'iana', [
		'mc1',
	], false, ''}
	'application/vnd.mediastation.cdkey':                                                   MimeType{'iana', [
		'cdkey',
	], false, ''}
	'application/vnd.meridian-slingshot':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.mfer':                                                                 MimeType{'iana', [
		'mwf',
	], false, ''}
	'application/vnd.mfmp':                                                                 MimeType{'iana', [
		'mfm',
	], false, ''}
	'application/vnd.micro+json':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.micrografx.flo':                                                       MimeType{'iana', [
		'flo',
	], false, ''}
	'application/vnd.micrografx.igx':                                                       MimeType{'iana', [
		'igx',
	], false, ''}
	'application/vnd.microsoft.portable-executable':                                        MimeType{'iana', [], false, ''}
	'application/vnd.microsoft.windows.thumbnail-cache':                                    MimeType{'iana', [], false, ''}
	'application/vnd.miele+json':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.mif':                                                                  MimeType{'iana', [
		'mif',
	], false, ''}
	'application/vnd.minisoft-hp3000-save':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.mitsubishi.misty-guard.trustweb':                                      MimeType{'iana', [], false, ''}
	'application/vnd.mobius.daf':                                                           MimeType{'iana', [
		'daf',
	], false, ''}
	'application/vnd.mobius.dis':                                                           MimeType{'iana', [
		'dis',
	], false, ''}
	'application/vnd.mobius.mbk':                                                           MimeType{'iana', [
		'mbk',
	], false, ''}
	'application/vnd.mobius.mqy':                                                           MimeType{'iana', [
		'mqy',
	], false, ''}
	'application/vnd.mobius.msl':                                                           MimeType{'iana', [
		'msl',
	], false, ''}
	'application/vnd.mobius.plc':                                                           MimeType{'iana', [
		'plc',
	], false, ''}
	'application/vnd.mobius.txf':                                                           MimeType{'iana', [
		'txf',
	], false, ''}
	'application/vnd.mophun.application':                                                   MimeType{'iana', [
		'mpn',
	], false, ''}
	'application/vnd.mophun.certificate':                                                   MimeType{'iana', [
		'mpc',
	], false, ''}
	'application/vnd.motorola.flexsuite':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.motorola.flexsuite.adsi':                                              MimeType{'iana', [], false, ''}
	'application/vnd.motorola.flexsuite.fis':                                               MimeType{'iana', [], false, ''}
	'application/vnd.motorola.flexsuite.gotap':                                             MimeType{'iana', [], false, ''}
	'application/vnd.motorola.flexsuite.kmr':                                               MimeType{'iana', [], false, ''}
	'application/vnd.motorola.flexsuite.ttc':                                               MimeType{'iana', [], false, ''}
	'application/vnd.motorola.flexsuite.wem':                                               MimeType{'iana', [], false, ''}
	'application/vnd.motorola.iprm':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.mozilla.xul+xml':                                                      MimeType{'iana', [
		'xul',
	], true, ''}
	'application/vnd.ms-3mfdocument':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.ms-artgalry':                                                          MimeType{'iana', [
		'cil',
	], false, ''}
	'application/vnd.ms-asf':                                                               MimeType{'iana', [], false, ''}
	'application/vnd.ms-cab-compressed':                                                    MimeType{'iana', [
		'cab',
	], false, ''}
	'application/vnd.ms-color.iccprofile':                                                  MimeType{'apache', [], false, ''}
	'application/vnd.ms-excel':                                                             MimeType{'iana', [
		'xls',
		'xlm',
		'xla',
		'xlc',
		'xlt',
		'xlw',
	], false, ''}
	'application/vnd.ms-excel.addin.macroenabled.12':                                       MimeType{'iana', [
		'xlam',
	], false, ''}
	'application/vnd.ms-excel.sheet.binary.macroenabled.12':                                MimeType{'iana', [
		'xlsb',
	], false, ''}
	'application/vnd.ms-excel.sheet.macroenabled.12':                                       MimeType{'iana', [
		'xlsm',
	], false, ''}
	'application/vnd.ms-excel.template.macroenabled.12':                                    MimeType{'iana', [
		'xltm',
	], false, ''}
	'application/vnd.ms-fontobject':                                                        MimeType{'iana', [
		'eot',
	], true, ''}
	'application/vnd.ms-htmlhelp':                                                          MimeType{'iana', [
		'chm',
	], false, ''}
	'application/vnd.ms-ims':                                                               MimeType{'iana', [
		'ims',
	], false, ''}
	'application/vnd.ms-lrm':                                                               MimeType{'iana', [
		'lrm',
	], false, ''}
	'application/vnd.ms-office.activex+xml':                                                MimeType{'iana', [], true, ''}
	'application/vnd.ms-officetheme':                                                       MimeType{'iana', [
		'thmx',
	], false, ''}
	'application/vnd.ms-opentype':                                                          MimeType{'apache', [], true, ''}
	'application/vnd.ms-outlook':                                                           MimeType{'', [
		'msg',
	], false, ''}
	'application/vnd.ms-package.obfuscated-opentype':                                       MimeType{'apache', [], false, ''}
	'application/vnd.ms-pki.seccat':                                                        MimeType{'apache', [
		'cat',
	], false, ''}
	'application/vnd.ms-pki.stl':                                                           MimeType{'apache', [
		'stl',
	], false, ''}
	'application/vnd.ms-playready.initiator+xml':                                           MimeType{'iana', [], true, ''}
	'application/vnd.ms-powerpoint':                                                        MimeType{'iana', [
		'ppt',
		'pps',
		'pot',
	], false, ''}
	'application/vnd.ms-powerpoint.addin.macroenabled.12':                                  MimeType{'iana', [
		'ppam',
	], false, ''}
	'application/vnd.ms-powerpoint.presentation.macroenabled.12':                           MimeType{'iana', [
		'pptm',
	], false, ''}
	'application/vnd.ms-powerpoint.slide.macroenabled.12':                                  MimeType{'iana', [
		'sldm',
	], false, ''}
	'application/vnd.ms-powerpoint.slideshow.macroenabled.12':                              MimeType{'iana', [
		'ppsm',
	], false, ''}
	'application/vnd.ms-powerpoint.template.macroenabled.12':                               MimeType{'iana', [
		'potm',
	], false, ''}
	'application/vnd.ms-printdevicecapabilities+xml':                                       MimeType{'iana', [], true, ''}
	'application/vnd.ms-printing.printticket+xml':                                          MimeType{'apache', [], true, ''}
	'application/vnd.ms-printschematicket+xml':                                             MimeType{'iana', [], true, ''}
	'application/vnd.ms-project':                                                           MimeType{'iana', [
		'mpp',
		'mpt',
	], false, ''}
	'application/vnd.ms-tnef':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.ms-windows.devicepairing':                                             MimeType{'iana', [], false, ''}
	'application/vnd.ms-windows.nwprinting.oob':                                            MimeType{'iana', [], false, ''}
	'application/vnd.ms-windows.printerpairing':                                            MimeType{'iana', [], false, ''}
	'application/vnd.ms-windows.wsd.oob':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.ms-wmdrm.lic-chlg-req':                                                MimeType{'iana', [], false, ''}
	'application/vnd.ms-wmdrm.lic-resp':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.ms-wmdrm.meter-chlg-req':                                              MimeType{'iana', [], false, ''}
	'application/vnd.ms-wmdrm.meter-resp':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.ms-word.document.macroenabled.12':                                     MimeType{'iana', [
		'docm',
	], false, ''}
	'application/vnd.ms-word.template.macroenabled.12':                                     MimeType{'iana', [
		'dotm',
	], false, ''}
	'application/vnd.ms-works':                                                             MimeType{'iana', [
		'wps',
		'wks',
		'wcm',
		'wdb',
	], false, ''}
	'application/vnd.ms-wpl':                                                               MimeType{'iana', [
		'wpl',
	], false, ''}
	'application/vnd.ms-xpsdocument':                                                       MimeType{'iana', [
		'xps',
	], false, ''}
	'application/vnd.msa-disk-image':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.mseq':                                                                 MimeType{'iana', [
		'mseq',
	], false, ''}
	'application/vnd.msign':                                                                MimeType{'iana', [], false, ''}
	'application/vnd.multiad.creator':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.multiad.creator.cif':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.music-niff':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.musician':                                                             MimeType{'iana', [
		'mus',
	], false, ''}
	'application/vnd.muvee.style':                                                          MimeType{'iana', [
		'msty',
	], false, ''}
	'application/vnd.mynfc':                                                                MimeType{'iana', [
		'taglet',
	], false, ''}
	'application/vnd.ncd.control':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.ncd.reference':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.nearst.inv+json':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.nervana':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.netfpx':                                                               MimeType{'iana', [], false, ''}
	'application/vnd.neurolanguage.nlu':                                                    MimeType{'iana', [
		'nlu',
	], false, ''}
	'application/vnd.nimn':                                                                 MimeType{'iana', [], false, ''}
	'application/vnd.nintendo.nitro.rom':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.nintendo.snes.rom':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.nitf':                                                                 MimeType{'iana', [
		'ntf',
		'nitf',
	], false, ''}
	'application/vnd.noblenet-directory':                                                   MimeType{'iana', [
		'nnd',
	], false, ''}
	'application/vnd.noblenet-sealer':                                                      MimeType{'iana', [
		'nns',
	], false, ''}
	'application/vnd.noblenet-web':                                                         MimeType{'iana', [
		'nnw',
	], false, ''}
	'application/vnd.nokia.catalogs':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.nokia.conml+wbxml':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.nokia.conml+xml':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.nokia.iptv.config+xml':                                                MimeType{'iana', [], true, ''}
	'application/vnd.nokia.isds-radio-presets':                                             MimeType{'iana', [], false, ''}
	'application/vnd.nokia.landmark+wbxml':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.nokia.landmark+xml':                                                   MimeType{'iana', [], true, ''}
	'application/vnd.nokia.landmarkcollection+xml':                                         MimeType{'iana', [], true, ''}
	'application/vnd.nokia.n-gage.ac+xml':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.nokia.n-gage.data':                                                    MimeType{'iana', [
		'ngdat',
	], false, ''}
	'application/vnd.nokia.n-gage.symbian.install':                                         MimeType{'iana', [
		'n-gage',
	], false, ''}
	'application/vnd.nokia.ncd':                                                            MimeType{'iana', [], false, ''}
	'application/vnd.nokia.pcd+wbxml':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.nokia.pcd+xml':                                                        MimeType{'iana', [], true, ''}
	'application/vnd.nokia.radio-preset':                                                   MimeType{'iana', [
		'rpst',
	], false, ''}
	'application/vnd.nokia.radio-presets':                                                  MimeType{'iana', [
		'rpss',
	], false, ''}
	'application/vnd.novadigm.edm':                                                         MimeType{'iana', [
		'edm',
	], false, ''}
	'application/vnd.novadigm.edx':                                                         MimeType{'iana', [
		'edx',
	], false, ''}
	'application/vnd.novadigm.ext':                                                         MimeType{'iana', [
		'ext',
	], false, ''}
	'application/vnd.ntt-local.content-share':                                              MimeType{'iana', [], false, ''}
	'application/vnd.ntt-local.file-transfer':                                              MimeType{'iana', [], false, ''}
	'application/vnd.ntt-local.ogw_remote-access':                                          MimeType{'iana', [], false, ''}
	'application/vnd.ntt-local.sip-ta_remote':                                              MimeType{'iana', [], false, ''}
	'application/vnd.ntt-local.sip-ta_tcp_stream':                                          MimeType{'iana', [], false, ''}
	'application/vnd.oasis.opendocument.chart':                                             MimeType{'iana', [
		'odc',
	], false, ''}
	'application/vnd.oasis.opendocument.chart-template':                                    MimeType{'iana', [
		'otc',
	], false, ''}
	'application/vnd.oasis.opendocument.database':                                          MimeType{'iana', [
		'odb',
	], false, ''}
	'application/vnd.oasis.opendocument.formula':                                           MimeType{'iana', [
		'odf',
	], false, ''}
	'application/vnd.oasis.opendocument.formula-template':                                  MimeType{'iana', [
		'odft',
	], false, ''}
	'application/vnd.oasis.opendocument.graphics':                                          MimeType{'iana', [
		'odg',
	], false, ''}
	'application/vnd.oasis.opendocument.graphics-template':                                 MimeType{'iana', [
		'otg',
	], false, ''}
	'application/vnd.oasis.opendocument.image':                                             MimeType{'iana', [
		'odi',
	], false, ''}
	'application/vnd.oasis.opendocument.image-template':                                    MimeType{'iana', [
		'oti',
	], false, ''}
	'application/vnd.oasis.opendocument.presentation':                                      MimeType{'iana', [
		'odp',
	], false, ''}
	'application/vnd.oasis.opendocument.presentation-template':                             MimeType{'iana', [
		'otp',
	], false, ''}
	'application/vnd.oasis.opendocument.spreadsheet':                                       MimeType{'iana', [
		'ods',
	], false, ''}
	'application/vnd.oasis.opendocument.spreadsheet-template':                              MimeType{'iana', [
		'ots',
	], false, ''}
	'application/vnd.oasis.opendocument.text':                                              MimeType{'iana', [
		'odt',
	], false, ''}
	'application/vnd.oasis.opendocument.text-master':                                       MimeType{'iana', [
		'odm',
	], false, ''}
	'application/vnd.oasis.opendocument.text-template':                                     MimeType{'iana', [
		'ott',
	], false, ''}
	'application/vnd.oasis.opendocument.text-web':                                          MimeType{'iana', [
		'oth',
	], false, ''}
	'application/vnd.obn':                                                                  MimeType{'iana', [], false, ''}
	'application/vnd.ocf+cbor':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.oftn.l10n+json':                                                       MimeType{'iana', [], true, ''}
	'application/vnd.oipf.contentaccessdownload+xml':                                       MimeType{'iana', [], true, ''}
	'application/vnd.oipf.contentaccessstreaming+xml':                                      MimeType{'iana', [], true, ''}
	'application/vnd.oipf.cspg-hexbinary':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.oipf.dae.svg+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.oipf.dae.xhtml+xml':                                                   MimeType{'iana', [], true, ''}
	'application/vnd.oipf.mippvcontrolmessage+xml':                                         MimeType{'iana', [], true, ''}
	'application/vnd.oipf.pae.gem':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.oipf.spdiscovery+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.oipf.spdlist+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.oipf.ueprofile+xml':                                                   MimeType{'iana', [], true, ''}
	'application/vnd.oipf.userprofile+xml':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.olpc-sugar':                                                           MimeType{'iana', [
		'xo',
	], false, ''}
	'application/vnd.oma-scws-config':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.oma-scws-http-request':                                                MimeType{'iana', [], false, ''}
	'application/vnd.oma-scws-http-response':                                               MimeType{'iana', [], false, ''}
	'application/vnd.oma.bcast.associated-procedure-parameter+xml':                         MimeType{'iana', [], true, ''}
	'application/vnd.oma.bcast.drm-trigger+xml':                                            MimeType{'iana', [], true, ''}
	'application/vnd.oma.bcast.imd+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.oma.bcast.ltkm':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.oma.bcast.notification+xml':                                           MimeType{'iana', [], true, ''}
	'application/vnd.oma.bcast.provisioningtrigger':                                        MimeType{'iana', [], false, ''}
	'application/vnd.oma.bcast.sgboot':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.oma.bcast.sgdd+xml':                                                   MimeType{'iana', [], true, ''}
	'application/vnd.oma.bcast.sgdu':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.oma.bcast.simple-symbol-container':                                    MimeType{'iana', [], false, ''}
	'application/vnd.oma.bcast.smartcard-trigger+xml':                                      MimeType{'iana', [], true, ''}
	'application/vnd.oma.bcast.sprov+xml':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.oma.bcast.stkm':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.oma.cab-address-book+xml':                                             MimeType{'iana', [], true, ''}
	'application/vnd.oma.cab-feature-handler+xml':                                          MimeType{'iana', [], true, ''}
	'application/vnd.oma.cab-pcc+xml':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.oma.cab-subs-invite+xml':                                              MimeType{'iana', [], true, ''}
	'application/vnd.oma.cab-user-prefs+xml':                                               MimeType{'iana', [], true, ''}
	'application/vnd.oma.dcd':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.oma.dcdc':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.oma.dd2+xml':                                                          MimeType{'iana', [
		'dd2',
	], true, ''}
	'application/vnd.oma.drm.risd+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.oma.group-usage-list+xml':                                             MimeType{'iana', [], true, ''}
	'application/vnd.oma.lwm2m+json':                                                       MimeType{'iana', [], true, ''}
	'application/vnd.oma.lwm2m+tlv':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.oma.pal+xml':                                                          MimeType{'iana', [], true, ''}
	'application/vnd.oma.poc.detailed-progress-report+xml':                                 MimeType{'iana', [], true, ''}
	'application/vnd.oma.poc.final-report+xml':                                             MimeType{'iana', [], true, ''}
	'application/vnd.oma.poc.groups+xml':                                                   MimeType{'iana', [], true, ''}
	'application/vnd.oma.poc.invocation-descriptor+xml':                                    MimeType{'iana', [], true, ''}
	'application/vnd.oma.poc.optimized-progress-report+xml':                                MimeType{'iana', [], true, ''}
	'application/vnd.oma.push':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.oma.scidm.messages+xml':                                               MimeType{'iana', [], true, ''}
	'application/vnd.oma.xcap-directory+xml':                                               MimeType{'iana', [], true, ''}
	'application/vnd.omads-email+xml':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.omads-file+xml':                                                       MimeType{'iana', [], true, ''}
	'application/vnd.omads-folder+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.omaloc-supl-init':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.onepager':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.onepagertamp':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.onepagertamx':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.onepagertat':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.onepagertatp':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.onepagertatx':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.openblox.game+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.openblox.game-binary':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.openeye.oeb':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.openofficeorg.extension':                                              MimeType{'apache', [
		'oxt',
	], false, ''}
	'application/vnd.openstreetmap.data+xml':                                               MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.custom-properties+xml':                  MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.customxmlproperties+xml':                MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.drawing+xml':                            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.drawingml.chart+xml':                    MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.drawingml.chartshapes+xml':              MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.drawingml.diagramcolors+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.drawingml.diagramdata+xml':              MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.drawingml.diagramlayout+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.drawingml.diagramstyle+xml':             MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.extended-properties+xml':                MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.commentauthors+xml':      MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.comments+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.handoutmaster+xml':       MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.notesmaster+xml':         MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.notesslide+xml':          MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.presentation':            MimeType{'iana', [
		'pptx',
	], false, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml':   MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.presprops+xml':           MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.slide':                   MimeType{'iana', [
		'sldx',
	], false, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.slide+xml':               MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.slidelayout+xml':         MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.slidemaster+xml':         MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.slideshow':               MimeType{'iana', [
		'ppsx',
	], false, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.slideshow.main+xml':      MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.slideupdateinfo+xml':     MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.tablestyles+xml':         MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.tags+xml':                MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.template':                MimeType{'iana', [
		'potx',
	], false, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.template.main+xml':       MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.presentationml.viewprops+xml':           MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.calcchain+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.chartsheet+xml':           MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.comments+xml':             MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.connections+xml':          MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.dialogsheet+xml':          MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.externallink+xml':         MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.pivotcachedefinition+xml': MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.pivotcacherecords+xml':    MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.pivottable+xml':           MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.querytable+xml':           MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.revisionheaders+xml':      MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.revisionlog+xml':          MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.sharedstrings+xml':        MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':                    MimeType{'iana', [
		'xlsx',
	], false, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml':           MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.sheetmetadata+xml':        MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml':               MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.table+xml':                MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.tablesinglecells+xml':     MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.template':                 MimeType{'iana', [
		'xltx',
	], false, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.template.main+xml':        MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.usernames+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.volatiledependencies+xml': MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.theme+xml':                              MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.themeoverride+xml':                      MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.vmldrawing':                             MimeType{'iana', [], false, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.comments+xml':          MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.document':              MimeType{'iana', [
		'docx',
	], false, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.document.glossary+xml': MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml':     MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.endnotes+xml':          MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.fonttable+xml':         MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.footnotes+xml':         MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml':         MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml':          MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.template':              MimeType{'iana', [
		'dotx',
	], false, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.template.main+xml':     MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-officedocument.wordprocessingml.websettings+xml':       MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-package.core-properties+xml':                           MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-package.digital-signature-xmlsignature+xml':            MimeType{'iana', [], true, ''}
	'application/vnd.openxmlformats-package.relationships+xml':                             MimeType{'iana', [], true, ''}
	'application/vnd.oracle.resource+json':                                                 MimeType{'iana', [], true, ''}
	'application/vnd.orange.indata':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.osa.netdeploy':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.osgeo.mapguide.package':                                               MimeType{'iana', [
		'mgp',
	], false, ''}
	'application/vnd.osgi.bundle':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.osgi.dp':                                                              MimeType{'iana', [
		'dp',
	], false, ''}
	'application/vnd.osgi.subsystem':                                                       MimeType{'iana', [
		'esa',
	], false, ''}
	'application/vnd.otps.ct-kip+xml':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.oxli.countgraph':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.pagerduty+json':                                                       MimeType{'iana', [], true, ''}
	'application/vnd.palm':                                                                 MimeType{'iana', [
		'pdb',
		'pqa',
		'oprc',
	], false, ''}
	'application/vnd.panoply':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.paos.xml':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.patentdive':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.patientecommsdoc':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.pawaafile':                                                            MimeType{'iana', [
		'paw',
	], false, ''}
	'application/vnd.pcos':                                                                 MimeType{'iana', [], false, ''}
	'application/vnd.pg.format':                                                            MimeType{'iana', [
		'str',
	], false, ''}
	'application/vnd.pg.osasli':                                                            MimeType{'iana', [
		'ei6',
	], false, ''}
	'application/vnd.piaccess.application-licence':                                         MimeType{'iana', [], false, ''}
	'application/vnd.picsel':                                                               MimeType{'iana', [
		'efif',
	], false, ''}
	'application/vnd.pmi.widget':                                                           MimeType{'iana', [
		'wg',
	], false, ''}
	'application/vnd.poc.group-advertisement+xml':                                          MimeType{'iana', [], true, ''}
	'application/vnd.pocketlearn':                                                          MimeType{'iana', [
		'plf',
	], false, ''}
	'application/vnd.powerbuilder6':                                                        MimeType{'iana', [
		'pbd',
	], false, ''}
	'application/vnd.powerbuilder6-s':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.powerbuilder7':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.powerbuilder7-s':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.powerbuilder75':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.powerbuilder75-s':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.preminet':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.previewsystems.box':                                                   MimeType{'iana', [
		'box',
	], false, ''}
	'application/vnd.proteus.magazine':                                                     MimeType{'iana', [
		'mgz',
	], false, ''}
	'application/vnd.psfs':                                                                 MimeType{'iana', [], false, ''}
	'application/vnd.publishare-delta-tree':                                                MimeType{'iana', [
		'qps',
	], false, ''}
	'application/vnd.pvi.ptid1':                                                            MimeType{'iana', [
		'ptid',
	], false, ''}
	'application/vnd.pwg-multiplexed':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.pwg-xhtml-print+xml':                                                  MimeType{'iana', [], true, ''}
	'application/vnd.qualcomm.brew-app-res':                                                MimeType{'iana', [], false, ''}
	'application/vnd.quarantainenet':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.quark.quarkxpress':                                                    MimeType{'iana', [
		'qxd',
		'qxt',
		'qwd',
		'qwt',
		'qxl',
		'qxb',
	], false, ''}
	'application/vnd.quobject-quoxdocument':                                                MimeType{'iana', [], false, ''}
	'application/vnd.radisys.moml+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-audit+xml':                                               MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-audit-conf+xml':                                          MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-audit-conn+xml':                                          MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-audit-dialog+xml':                                        MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-audit-stream+xml':                                        MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-conf+xml':                                                MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-dialog+xml':                                              MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-dialog-base+xml':                                         MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-dialog-fax-detect+xml':                                   MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-dialog-fax-sendrecv+xml':                                 MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-dialog-group+xml':                                        MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-dialog-speech+xml':                                       MimeType{'iana', [], true, ''}
	'application/vnd.radisys.msml-dialog-transform+xml':                                    MimeType{'iana', [], true, ''}
	'application/vnd.rainstor.data':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.rapid':                                                                MimeType{'iana', [], false, ''}
	'application/vnd.rar':                                                                  MimeType{'iana', [], false, ''}
	'application/vnd.realvnc.bed':                                                          MimeType{'iana', [
		'bed',
	], false, ''}
	'application/vnd.recordare.musicxml':                                                   MimeType{'iana', [
		'mxl',
	], false, ''}
	'application/vnd.recordare.musicxml+xml':                                               MimeType{'iana', [
		'musicxml',
	], true, ''}
	'application/vnd.renlearn.rlprint':                                                     MimeType{'iana', [], false, ''}
	'application/vnd.restful+json':                                                         MimeType{'iana', [], true, ''}
	'application/vnd.rig.cryptonote':                                                       MimeType{'iana', [
		'cryptonote',
	], false, ''}
	'application/vnd.rim.cod':                                                              MimeType{'apache', [
		'cod',
	], false, ''}
	'application/vnd.rn-realmedia':                                                         MimeType{'apache', [
		'rm',
	], false, ''}
	'application/vnd.rn-realmedia-vbr':                                                     MimeType{'apache', [
		'rmvb',
	], false, ''}
	'application/vnd.route66.link66+xml':                                                   MimeType{'iana', [
		'link66',
	], true, ''}
	'application/vnd.rs-274x':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.ruckus.download':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.s3sms':                                                                MimeType{'iana', [], false, ''}
	'application/vnd.sailingtracker.track':                                                 MimeType{'iana', [
		'st',
	], false, ''}
	'application/vnd.sbm.cid':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.sbm.mid2':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.scribus':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.sealed.3df':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.sealed.csf':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.sealed.doc':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.sealed.eml':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.sealed.mht':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.sealed.net':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.sealed.ppt':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.sealed.tiff':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.sealed.xls':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.sealedmedia.softseal.html':                                            MimeType{'iana', [], false, ''}
	'application/vnd.sealedmedia.softseal.pdf':                                             MimeType{'iana', [], false, ''}
	'application/vnd.seemail':                                                              MimeType{'iana', [
		'see',
	], false, ''}
	'application/vnd.sema':                                                                 MimeType{'iana', [
		'sema',
	], false, ''}
	'application/vnd.semd':                                                                 MimeType{'iana', [
		'semd',
	], false, ''}
	'application/vnd.semf':                                                                 MimeType{'iana', [
		'semf',
	], false, ''}
	'application/vnd.shana.informed.formdata':                                              MimeType{'iana', [
		'ifm',
	], false, ''}
	'application/vnd.shana.informed.formtemplate':                                          MimeType{'iana', [
		'itp',
	], false, ''}
	'application/vnd.shana.informed.interchange':                                           MimeType{'iana', [
		'iif',
	], false, ''}
	'application/vnd.shana.informed.package':                                               MimeType{'iana', [
		'ipk',
	], false, ''}
	'application/vnd.shootproof+json':                                                      MimeType{'iana', [], true, ''}
	'application/vnd.sigrok.session':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.simtech-mindmapper':                                                   MimeType{'iana', [
		'twd',
		'twds',
	], false, ''}
	'application/vnd.siren+json':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.smaf':                                                                 MimeType{'iana', [
		'mmf',
	], false, ''}
	'application/vnd.smart.notebook':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.smart.teacher':                                                        MimeType{'iana', [
		'teacher',
	], false, ''}
	'application/vnd.software602.filler.form+xml':                                          MimeType{'iana', [], true, ''}
	'application/vnd.software602.filler.form-xml-zip':                                      MimeType{'iana', [], false, ''}
	'application/vnd.solent.sdkm+xml':                                                      MimeType{'iana', [
		'sdkm',
		'sdkd',
	], true, ''}
	'application/vnd.spotfire.dxp':                                                         MimeType{'iana', [
		'dxp',
	], false, ''}
	'application/vnd.spotfire.sfs':                                                         MimeType{'iana', [
		'sfs',
	], false, ''}
	'application/vnd.sqlite3':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.sss-cod':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.sss-dtf':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.sss-ntf':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.stardivision.calc':                                                    MimeType{'apache', [
		'sdc',
	], false, ''}
	'application/vnd.stardivision.draw':                                                    MimeType{'apache', [
		'sda',
	], false, ''}
	'application/vnd.stardivision.impress':                                                 MimeType{'apache', [
		'sdd',
	], false, ''}
	'application/vnd.stardivision.math':                                                    MimeType{'apache', [
		'smf',
	], false, ''}
	'application/vnd.stardivision.writer':                                                  MimeType{'apache', [
		'sdw',
		'vor',
	], false, ''}
	'application/vnd.stardivision.writer-global':                                           MimeType{'apache', [
		'sgl',
	], false, ''}
	'application/vnd.stepmania.package':                                                    MimeType{'iana', [
		'smzip',
	], false, ''}
	'application/vnd.stepmania.stepchart':                                                  MimeType{'iana', [
		'sm',
	], false, ''}
	'application/vnd.street-stream':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.sun.wadl+xml':                                                         MimeType{'iana', [
		'wadl',
	], true, ''}
	'application/vnd.sun.xml.calc':                                                         MimeType{'apache', [
		'sxc',
	], false, ''}
	'application/vnd.sun.xml.calc.template':                                                MimeType{'apache', [
		'stc',
	], false, ''}
	'application/vnd.sun.xml.draw':                                                         MimeType{'apache', [
		'sxd',
	], false, ''}
	'application/vnd.sun.xml.draw.template':                                                MimeType{'apache', [
		'std',
	], false, ''}
	'application/vnd.sun.xml.impress':                                                      MimeType{'apache', [
		'sxi',
	], false, ''}
	'application/vnd.sun.xml.impress.template':                                             MimeType{'apache', [
		'sti',
	], false, ''}
	'application/vnd.sun.xml.math':                                                         MimeType{'apache', [
		'sxm',
	], false, ''}
	'application/vnd.sun.xml.writer':                                                       MimeType{'apache', [
		'sxw',
	], false, ''}
	'application/vnd.sun.xml.writer.global':                                                MimeType{'apache', [
		'sxg',
	], false, ''}
	'application/vnd.sun.xml.writer.template':                                              MimeType{'apache', [
		'stw',
	], false, ''}
	'application/vnd.sus-calendar':                                                         MimeType{'iana', [
		'sus',
		'susp',
	], false, ''}
	'application/vnd.svd':                                                                  MimeType{'iana', [
		'svd',
	], false, ''}
	'application/vnd.swiftview-ics':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.symbian.install':                                                      MimeType{'apache', [
		'sis',
		'sisx',
	], false, ''}
	'application/vnd.syncml+xml':                                                           MimeType{'iana', [
		'xsm',
	], true, ''}
	'application/vnd.syncml.dm+wbxml':                                                      MimeType{'iana', [
		'bdm',
	], false, ''}
	'application/vnd.syncml.dm+xml':                                                        MimeType{'iana', [
		'xdm',
	], true, ''}
	'application/vnd.syncml.dm.notification':                                               MimeType{'iana', [], false, ''}
	'application/vnd.syncml.dmddf+wbxml':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.syncml.dmddf+xml':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.syncml.dmtnds+wbxml':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.syncml.dmtnds+xml':                                                    MimeType{'iana', [], true, ''}
	'application/vnd.syncml.ds.notification':                                               MimeType{'iana', [], false, ''}
	'application/vnd.tableschema+json':                                                     MimeType{'iana', [], true, ''}
	'application/vnd.tao.intent-module-archive':                                            MimeType{'iana', [
		'tao',
	], false, ''}
	'application/vnd.tcpdump.pcap':                                                         MimeType{'iana', [
		'pcap',
		'cap',
		'dmp',
	], false, ''}
	'application/vnd.think-cell.ppttc+json':                                                MimeType{'iana', [], true, ''}
	'application/vnd.tmd.mediaflex.api+xml':                                                MimeType{'iana', [], true, ''}
	'application/vnd.tml':                                                                  MimeType{'iana', [], false, ''}
	'application/vnd.tmobile-livetv':                                                       MimeType{'iana', [
		'tmo',
	], false, ''}
	'application/vnd.tri.onesource':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.trid.tpt':                                                             MimeType{'iana', [
		'tpt',
	], false, ''}
	'application/vnd.triscape.mxs':                                                         MimeType{'iana', [
		'mxs',
	], false, ''}
	'application/vnd.trueapp':                                                              MimeType{'iana', [
		'tra',
	], false, ''}
	'application/vnd.truedoc':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.ubisoft.webplayer':                                                    MimeType{'iana', [], false, ''}
	'application/vnd.ufdl':                                                                 MimeType{'iana', [
		'ufd',
		'ufdl',
	], false, ''}
	'application/vnd.uiq.theme':                                                            MimeType{'iana', [
		'utz',
	], false, ''}
	'application/vnd.umajin':                                                               MimeType{'iana', [
		'umj',
	], false, ''}
	'application/vnd.unity':                                                                MimeType{'iana', [
		'unityweb',
	], false, ''}
	'application/vnd.uoml+xml':                                                             MimeType{'iana', [
		'uoml',
	], true, ''}
	'application/vnd.uplanet.alert':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.alert-wbxml':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.bearer-choice':                                                MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.bearer-choice-wbxml':                                          MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.cacheop':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.cacheop-wbxml':                                                MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.channel':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.channel-wbxml':                                                MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.list':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.list-wbxml':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.listcmd':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.listcmd-wbxml':                                                MimeType{'iana', [], false, ''}
	'application/vnd.uplanet.signal':                                                       MimeType{'iana', [], false, ''}
	'application/vnd.uri-map':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.valve.source.material':                                                MimeType{'iana', [], false, ''}
	'application/vnd.vcx':                                                                  MimeType{'iana', [
		'vcx',
	], false, ''}
	'application/vnd.vd-study':                                                             MimeType{'iana', [], false, ''}
	'application/vnd.vectorworks':                                                          MimeType{'iana', [], false, ''}
	'application/vnd.vel+json':                                                             MimeType{'iana', [], true, ''}
	'application/vnd.verimatrix.vcas':                                                      MimeType{'iana', [], false, ''}
	'application/vnd.veryant.thin':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.vidsoft.vidconference':                                                MimeType{'iana', [], false, ''}
	'application/vnd.visio':                                                                MimeType{'iana', [
		'vsd',
		'vst',
		'vss',
		'vsw',
	], false, ''}
	'application/vnd.visionary':                                                            MimeType{'iana', [
		'vis',
	], false, ''}
	'application/vnd.vividence.scriptfile':                                                 MimeType{'iana', [], false, ''}
	'application/vnd.vsf':                                                                  MimeType{'iana', [
		'vsf',
	], false, ''}
	'application/vnd.wap.sic':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.wap.slc':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.wap.wbxml':                                                            MimeType{'iana', [
		'wbxml',
	], false, ''}
	'application/vnd.wap.wmlc':                                                             MimeType{'iana', [
		'wmlc',
	], false, ''}
	'application/vnd.wap.wmlscriptc':                                                       MimeType{'iana', [
		'wmlsc',
	], false, ''}
	'application/vnd.webturbo':                                                             MimeType{'iana', [
		'wtb',
	], false, ''}
	'application/vnd.wfa.p2p':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.wfa.wsc':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.windows.devicepairing':                                                MimeType{'iana', [], false, ''}
	'application/vnd.wmc':                                                                  MimeType{'iana', [], false, ''}
	'application/vnd.wmf.bootstrap':                                                        MimeType{'iana', [], false, ''}
	'application/vnd.wolfram.mathematica':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.wolfram.mathematica.package':                                          MimeType{'iana', [], false, ''}
	'application/vnd.wolfram.player':                                                       MimeType{'iana', [
		'nbp',
	], false, ''}
	'application/vnd.wordperfect':                                                          MimeType{'iana', [
		'wpd',
	], false, ''}
	'application/vnd.wqd':                                                                  MimeType{'iana', [
		'wqd',
	], false, ''}
	'application/vnd.wrq-hp3000-labelled':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.wt.stf':                                                               MimeType{'iana', [
		'stf',
	], false, ''}
	'application/vnd.wv.csp+wbxml':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.wv.csp+xml':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.wv.ssp+xml':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.xacml+json':                                                           MimeType{'iana', [], true, ''}
	'application/vnd.xara':                                                                 MimeType{'iana', [
		'xar',
	], false, ''}
	'application/vnd.xfdl':                                                                 MimeType{'iana', [
		'xfdl',
	], false, ''}
	'application/vnd.xfdl.webform':                                                         MimeType{'iana', [], false, ''}
	'application/vnd.xmi+xml':                                                              MimeType{'iana', [], true, ''}
	'application/vnd.xmpie.cpkg':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.xmpie.dpkg':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.xmpie.plan':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.xmpie.ppkg':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.xmpie.xlim':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.yamaha.hv-dic':                                                        MimeType{'iana', [
		'hvd',
	], false, ''}
	'application/vnd.yamaha.hv-script':                                                     MimeType{'iana', [
		'hvs',
	], false, ''}
	'application/vnd.yamaha.hv-voice':                                                      MimeType{'iana', [
		'hvp',
	], false, ''}
	'application/vnd.yamaha.openscoreformat':                                               MimeType{'iana', [
		'osf',
	], false, ''}
	'application/vnd.yamaha.openscoreformat.osfpvg+xml':                                    MimeType{'iana', [
		'osfpvg',
	], true, ''}
	'application/vnd.yamaha.remote-setup':                                                  MimeType{'iana', [], false, ''}
	'application/vnd.yamaha.smaf-audio':                                                    MimeType{'iana', [
		'saf',
	], false, ''}
	'application/vnd.yamaha.smaf-phrase':                                                   MimeType{'iana', [
		'spf',
	], false, ''}
	'application/vnd.yamaha.through-ngn':                                                   MimeType{'iana', [], false, ''}
	'application/vnd.yamaha.tunnel-udpencap':                                               MimeType{'iana', [], false, ''}
	'application/vnd.yaoweme':                                                              MimeType{'iana', [], false, ''}
	'application/vnd.yellowriver-custom-menu':                                              MimeType{'iana', [
		'cmp',
	], false, ''}
	'application/vnd.youtube.yt':                                                           MimeType{'iana', [], false, ''}
	'application/vnd.zul':                                                                  MimeType{'iana', [
		'zir',
		'zirz',
	], false, ''}
	'application/vnd.zzazz.deck+xml':                                                       MimeType{'iana', [
		'zaz',
	], true, ''}
	'application/voicexml+xml':                                                             MimeType{'iana', [
		'vxml',
	], true, ''}
	'application/voucher-cms+json':                                                         MimeType{'iana', [], true, ''}
	'application/vq-rtcpxr':                                                                MimeType{'iana', [], false, ''}
	'application/wasm':                                                                     MimeType{'', [
		'wasm',
	], true, ''}
	'application/watcherinfo+xml':                                                          MimeType{'iana', [], true, ''}
	'application/webpush-options+json':                                                     MimeType{'iana', [], true, ''}
	'application/whoispp-query':                                                            MimeType{'iana', [], false, ''}
	'application/whoispp-response':                                                         MimeType{'iana', [], false, ''}
	'application/widget':                                                                   MimeType{'iana', [
		'wgt',
	], false, ''}
	'application/winhlp':                                                                   MimeType{'apache', [
		'hlp',
	], false, ''}
	'application/wita':                                                                     MimeType{'iana', [], false, ''}
	'application/wordperfect5.1':                                                           MimeType{'iana', [], false, ''}
	'application/wsdl+xml':                                                                 MimeType{'iana', [
		'wsdl',
	], true, ''}
	'application/wspolicy+xml':                                                             MimeType{'iana', [
		'wspolicy',
	], true, ''}
	'application/x-7z-compressed':                                                          MimeType{'apache', [
		'7z',
	], false, ''}
	'application/x-abiword':                                                                MimeType{'apache', [
		'abw',
	], false, ''}
	'application/x-ace-compressed':                                                         MimeType{'apache', [
		'ace',
	], false, ''}
	'application/x-amf':                                                                    MimeType{'apache', [], false, ''}
	'application/x-apple-diskimage':                                                        MimeType{'apache', [
		'dmg',
	], false, ''}
	'application/x-arj':                                                                    MimeType{'', [
		'arj',
	], false, ''}
	'application/x-authorware-bin':                                                         MimeType{'apache', [
		'aab',
		'x32',
		'u32',
		'vox',
	], false, ''}
	'application/x-authorware-map':                                                         MimeType{'apache', [
		'aam',
	], false, ''}
	'application/x-authorware-seg':                                                         MimeType{'apache', [
		'aas',
	], false, ''}
	'application/x-bcpio':                                                                  MimeType{'apache', [
		'bcpio',
	], false, ''}
	'application/x-bdoc':                                                                   MimeType{'', [
		'bdoc',
	], false, ''}
	'application/x-bittorrent':                                                             MimeType{'apache', [
		'torrent',
	], false, ''}
	'application/x-blorb':                                                                  MimeType{'apache', [
		'blb',
		'blorb',
	], false, ''}
	'application/x-bzip':                                                                   MimeType{'apache', [
		'bz',
	], false, ''}
	'application/x-bzip2':                                                                  MimeType{'apache', [
		'bz2',
		'boz',
	], false, ''}
	'application/x-cbr':                                                                    MimeType{'apache', [
		'cbr',
		'cba',
		'cbt',
		'cbz',
		'cb7',
	], false, ''}
	'application/x-cdlink':                                                                 MimeType{'apache', [
		'vcd',
	], false, ''}
	'application/x-cfs-compressed':                                                         MimeType{'apache', [
		'cfs',
	], false, ''}
	'application/x-chat':                                                                   MimeType{'apache', [
		'chat',
	], false, ''}
	'application/x-chess-pgn':                                                              MimeType{'apache', [
		'pgn',
	], false, ''}
	'application/x-chrome-extension':                                                       MimeType{'', [
		'crx',
	], false, ''}
	'application/x-cocoa':                                                                  MimeType{'nginx', [
		'cco',
	], false, ''}
	'application/x-compress':                                                               MimeType{'apache', [], false, ''}
	'application/x-conference':                                                             MimeType{'apache', [
		'nsc',
	], false, ''}
	'application/x-cpio':                                                                   MimeType{'apache', [
		'cpio',
	], false, ''}
	'application/x-csh':                                                                    MimeType{'apache', [
		'csh',
	], false, ''}
	'application/x-deb':                                                                    MimeType{'', [], false, ''}
	'application/x-debian-package':                                                         MimeType{'apache', [
		'deb',
		'udeb',
	], false, ''}
	'application/x-dgc-compressed':                                                         MimeType{'apache', [
		'dgc',
	], false, ''}
	'application/x-director':                                                               MimeType{'apache', [
		'dir',
		'dcr',
		'dxr',
		'cst',
		'cct',
		'cxt',
		'w3d',
		'fgd',
		'swa',
	], false, ''}
	'application/x-doom':                                                                   MimeType{'apache', [
		'wad',
	], false, ''}
	'application/x-dtbncx+xml':                                                             MimeType{'apache', [
		'ncx',
	], true, ''}
	'application/x-dtbook+xml':                                                             MimeType{'apache', [
		'dtb',
	], true, ''}
	'application/x-dtbresource+xml':                                                        MimeType{'apache', [
		'res',
	], true, ''}
	'application/x-dvi':                                                                    MimeType{'apache', [
		'dvi',
	], false, ''}
	'application/x-envoy':                                                                  MimeType{'apache', [
		'evy',
	], false, ''}
	'application/x-eva':                                                                    MimeType{'apache', [
		'eva',
	], false, ''}
	'application/x-font-bdf':                                                               MimeType{'apache', [
		'bdf',
	], false, ''}
	'application/x-font-dos':                                                               MimeType{'apache', [], false, ''}
	'application/x-font-framemaker':                                                        MimeType{'apache', [], false, ''}
	'application/x-font-ghostscript':                                                       MimeType{'apache', [
		'gsf',
	], false, ''}
	'application/x-font-libgrx':                                                            MimeType{'apache', [], false, ''}
	'application/x-font-linux-psf':                                                         MimeType{'apache', [
		'psf',
	], false, ''}
	'application/x-font-pcf':                                                               MimeType{'apache', [
		'pcf',
	], false, ''}
	'application/x-font-snf':                                                               MimeType{'apache', [
		'snf',
	], false, ''}
	'application/x-font-speedo':                                                            MimeType{'apache', [], false, ''}
	'application/x-font-sunos-news':                                                        MimeType{'apache', [], false, ''}
	'application/x-font-type1':                                                             MimeType{'apache', [
		'pfa',
		'pfb',
		'pfm',
		'afm',
	], false, ''}
	'application/x-font-vfont':                                                             MimeType{'apache', [], false, ''}
	'application/x-freearc':                                                                MimeType{'apache', [
		'arc',
	], false, ''}
	'application/x-futuresplash':                                                           MimeType{'apache', [
		'spl',
	], false, ''}
	'application/x-gca-compressed':                                                         MimeType{'apache', [
		'gca',
	], false, ''}
	'application/x-glulx':                                                                  MimeType{'apache', [
		'ulx',
	], false, ''}
	'application/x-gnumeric':                                                               MimeType{'apache', [
		'gnumeric',
	], false, ''}
	'application/x-gramps-xml':                                                             MimeType{'apache', [
		'gramps',
	], false, ''}
	'application/x-gtar':                                                                   MimeType{'apache', [
		'gtar',
	], false, ''}
	'application/x-gzip':                                                                   MimeType{'apache', [], false, ''}
	'application/x-hdf':                                                                    MimeType{'apache', [
		'hdf',
	], false, ''}
	'application/x-httpd-php':                                                              MimeType{'', [
		'php',
	], true, ''}
	'application/x-install-instructions':                                                   MimeType{'apache', [
		'install',
	], false, ''}
	'application/x-iso9660-image':                                                          MimeType{'apache', [
		'iso',
	], false, ''}
	'application/x-java-archive-diff':                                                      MimeType{'nginx', [
		'jardiff',
	], false, ''}
	'application/x-java-jnlp-file':                                                         MimeType{'apache', [
		'jnlp',
	], false, ''}
	'application/x-javascript':                                                             MimeType{'', [], true, ''}
	'application/x-latex':                                                                  MimeType{'apache', [
		'latex',
	], false, ''}
	'application/x-lua-bytecode':                                                           MimeType{'', [
		'luac',
	], false, ''}
	'application/x-lzh-compressed':                                                         MimeType{'apache', [
		'lzh',
		'lha',
	], false, ''}
	'application/x-makeself':                                                               MimeType{'nginx', [
		'run',
	], false, ''}
	'application/x-mie':                                                                    MimeType{'apache', [
		'mie',
	], false, ''}
	'application/x-mobipocket-ebook':                                                       MimeType{'apache', [
		'prc',
		'mobi',
	], false, ''}
	'application/x-mpegurl':                                                                MimeType{'', [], false, ''}
	'application/x-ms-application':                                                         MimeType{'apache', [
		'application',
	], false, ''}
	'application/x-ms-shortcut':                                                            MimeType{'apache', [
		'lnk',
	], false, ''}
	'application/x-ms-wmd':                                                                 MimeType{'apache', [
		'wmd',
	], false, ''}
	'application/x-ms-wmz':                                                                 MimeType{'apache', [
		'wmz',
	], false, ''}
	'application/x-ms-xbap':                                                                MimeType{'apache', [
		'xbap',
	], false, ''}
	'application/x-msaccess':                                                               MimeType{'apache', [
		'mdb',
	], false, ''}
	'application/x-msbinder':                                                               MimeType{'apache', [
		'obd',
	], false, ''}
	'application/x-mscardfile':                                                             MimeType{'apache', [
		'crd',
	], false, ''}
	'application/x-msclip':                                                                 MimeType{'apache', [
		'clp',
	], false, ''}
	'application/x-msdos-program':                                                          MimeType{'', [
		'exe',
	], false, ''}
	'application/x-msdownload':                                                             MimeType{'apache', [
		'exe',
		'dll',
		'com',
		'bat',
		'msi',
	], false, ''}
	'application/x-msmediaview':                                                            MimeType{'apache', [
		'mvb',
		'm13',
		'm14',
	], false, ''}
	'application/x-msmetafile':                                                             MimeType{'apache', [
		'wmf',
		'wmz',
		'emf',
		'emz',
	], false, ''}
	'application/x-msmoney':                                                                MimeType{'apache', [
		'mny',
	], false, ''}
	'application/x-mspublisher':                                                            MimeType{'apache', [
		'pub',
	], false, ''}
	'application/x-msschedule':                                                             MimeType{'apache', [
		'scd',
	], false, ''}
	'application/x-msterminal':                                                             MimeType{'apache', [
		'trm',
	], false, ''}
	'application/x-mswrite':                                                                MimeType{'apache', [
		'wri',
	], false, ''}
	'application/x-netcdf':                                                                 MimeType{'apache', [
		'nc',
		'cdf',
	], false, ''}
	'application/x-ns-proxy-autoconfig':                                                    MimeType{'', [
		'pac',
	], true, ''}
	'application/x-nzb':                                                                    MimeType{'apache', [
		'nzb',
	], false, ''}
	'application/x-perl':                                                                   MimeType{'nginx', [
		'pl',
		'pm',
	], false, ''}
	'application/x-pilot':                                                                  MimeType{'nginx', [
		'prc',
		'pdb',
	], false, ''}
	'application/x-pkcs12':                                                                 MimeType{'apache', [
		'p12',
		'pfx',
	], false, ''}
	'application/x-pkcs7-certificates':                                                     MimeType{'apache', [
		'p7b',
		'spc',
	], false, ''}
	'application/x-pkcs7-certreqresp':                                                      MimeType{'apache', [
		'p7r',
	], false, ''}
	'application/x-rar-compressed':                                                         MimeType{'apache', [
		'rar',
	], false, ''}
	'application/x-redhat-package-manager':                                                 MimeType{'nginx', [
		'rpm',
	], false, ''}
	'application/x-research-info-systems':                                                  MimeType{'apache', [
		'ris',
	], false, ''}
	'application/x-sea':                                                                    MimeType{'nginx', [
		'sea',
	], false, ''}
	'application/x-sh':                                                                     MimeType{'apache', [
		'sh',
	], true, ''}
	'application/x-shar':                                                                   MimeType{'apache', [
		'shar',
	], false, ''}
	'application/x-shockwave-flash':                                                        MimeType{'apache', [
		'swf',
	], false, ''}
	'application/x-silverlight-app':                                                        MimeType{'apache', [
		'xap',
	], false, ''}
	'application/x-sql':                                                                    MimeType{'apache', [
		'sql',
	], false, ''}
	'application/x-stuffit':                                                                MimeType{'apache', [
		'sit',
	], false, ''}
	'application/x-stuffitx':                                                               MimeType{'apache', [
		'sitx',
	], false, ''}
	'application/x-subrip':                                                                 MimeType{'apache', [
		'srt',
	], false, ''}
	'application/x-sv4cpio':                                                                MimeType{'apache', [
		'sv4cpio',
	], false, ''}
	'application/x-sv4crc':                                                                 MimeType{'apache', [
		'sv4crc',
	], false, ''}
	'application/x-t3vm-image':                                                             MimeType{'apache', [
		't3',
	], false, ''}
	'application/x-tads':                                                                   MimeType{'apache', [
		'gam',
	], false, ''}
	'application/x-tar':                                                                    MimeType{'apache', [
		'tar',
	], true, ''}
	'application/x-tcl':                                                                    MimeType{'apache', [
		'tcl',
		'tk',
	], false, ''}
	'application/x-tex':                                                                    MimeType{'apache', [
		'tex',
	], false, ''}
	'application/x-tex-tfm':                                                                MimeType{'apache', [
		'tfm',
	], false, ''}
	'application/x-texinfo':                                                                MimeType{'apache', [
		'texinfo',
		'texi',
	], false, ''}
	'application/x-tgif':                                                                   MimeType{'apache', [
		'obj',
	], false, ''}
	'application/x-ustar':                                                                  MimeType{'apache', [
		'ustar',
	], false, ''}
	'application/x-virtualbox-hdd':                                                         MimeType{'', [
		'hdd',
	], true, ''}
	'application/x-virtualbox-ova':                                                         MimeType{'', [
		'ova',
	], true, ''}
	'application/x-virtualbox-ovf':                                                         MimeType{'', [
		'ovf',
	], true, ''}
	'application/x-virtualbox-vbox':                                                        MimeType{'', [
		'vbox',
	], true, ''}
	'application/x-virtualbox-vbox-extpack':                                                MimeType{'', [
		'vbox-extpack',
	], false, ''}
	'application/x-virtualbox-vdi':                                                         MimeType{'', [
		'vdi',
	], true, ''}
	'application/x-virtualbox-vhd':                                                         MimeType{'', [
		'vhd',
	], true, ''}
	'application/x-virtualbox-vmdk':                                                        MimeType{'', [
		'vmdk',
	], true, ''}
	'application/x-wais-source':                                                            MimeType{'apache', [
		'src',
	], false, ''}
	'application/x-web-app-manifest+json':                                                  MimeType{'', [
		'webapp',
	], true, ''}
	'application/x-www-form-urlencoded':                                                    MimeType{'iana', [], true, ''}
	'application/x-x509-ca-cert':                                                           MimeType{'apache', [
		'der',
		'crt',
		'pem',
	], false, ''}
	'application/x-xfig':                                                                   MimeType{'apache', [
		'fig',
	], false, ''}
	'application/x-xliff+xml':                                                              MimeType{'apache', [
		'xlf',
	], true, ''}
	'application/x-xpinstall':                                                              MimeType{'apache', [
		'xpi',
	], false, ''}
	'application/x-xz':                                                                     MimeType{'apache', [
		'xz',
	], false, ''}
	'application/x-zmachine':                                                               MimeType{'apache', [
		'z1',
		'z2',
		'z3',
		'z4',
		'z5',
		'z6',
		'z7',
		'z8',
	], false, ''}
	'application/x400-bp':                                                                  MimeType{'iana', [], false, ''}
	'application/xacml+xml':                                                                MimeType{'iana', [], true, ''}
	'application/xaml+xml':                                                                 MimeType{'apache', [
		'xaml',
	], true, ''}
	'application/xcap-att+xml':                                                             MimeType{'iana', [], true, ''}
	'application/xcap-caps+xml':                                                            MimeType{'iana', [], true, ''}
	'application/xcap-diff+xml':                                                            MimeType{'iana', [
		'xdf',
	], true, ''}
	'application/xcap-el+xml':                                                              MimeType{'iana', [], true, ''}
	'application/xcap-error+xml':                                                           MimeType{'iana', [], true, ''}
	'application/xcap-ns+xml':                                                              MimeType{'iana', [], true, ''}
	'application/xcon-conference-info+xml':                                                 MimeType{'iana', [], true, ''}
	'application/xcon-conference-info-diff+xml':                                            MimeType{'iana', [], true, ''}
	'application/xenc+xml':                                                                 MimeType{'iana', [
		'xenc',
	], true, ''}
	'application/xhtml+xml':                                                                MimeType{'iana', [
		'xhtml',
		'xht',
	], true, ''}
	'application/xhtml-voice+xml':                                                          MimeType{'apache', [], true, ''}
	'application/xliff+xml':                                                                MimeType{'iana', [], true, ''}
	'application/xml':                                                                      MimeType{'iana', [
		'xml',
		'xsl',
		'xsd',
		'rng',
	], true, ''}
	'application/xml-dtd':                                                                  MimeType{'iana', [
		'dtd',
	], true, ''}
	'application/xml-external-parsed-entity':                                               MimeType{'iana', [], false, ''}
	'application/xml-patch+xml':                                                            MimeType{'iana', [], true, ''}
	'application/xmpp+xml':                                                                 MimeType{'iana', [], true, ''}
	'application/xop+xml':                                                                  MimeType{'iana', [
		'xop',
	], true, ''}
	'application/xproc+xml':                                                                MimeType{'apache', [
		'xpl',
	], true, ''}
	'application/xslt+xml':                                                                 MimeType{'iana', [
		'xslt',
	], true, ''}
	'application/xspf+xml':                                                                 MimeType{'apache', [
		'xspf',
	], true, ''}
	'application/xv+xml':                                                                   MimeType{'iana', [
		'mxml',
		'xhvml',
		'xvml',
		'xvm',
	], true, ''}
	'application/yang':                                                                     MimeType{'iana', [
		'yang',
	], false, ''}
	'application/yang-data+json':                                                           MimeType{'iana', [], true, ''}
	'application/yang-data+xml':                                                            MimeType{'iana', [], true, ''}
	'application/yang-patch+json':                                                          MimeType{'iana', [], true, ''}
	'application/yang-patch+xml':                                                           MimeType{'iana', [], true, ''}
	'application/yin+xml':                                                                  MimeType{'iana', [
		'yin',
	], true, ''}
	'application/zip':                                                                      MimeType{'iana', [
		'zip',
	], false, ''}
	'application/zlib':                                                                     MimeType{'iana', [], false, ''}
	'application/zstd':                                                                     MimeType{'iana', [], false, ''}
	'audio/1d-interleaved-parityfec':                                                       MimeType{'iana', [], false, ''}
	'audio/32kadpcm':                                                                       MimeType{'iana', [], false, ''}
	'audio/3gpp':                                                                           MimeType{'iana', [
		'3gpp',
	], false, ''}
	'audio/3gpp2':                                                                          MimeType{'iana', [], false, ''}
	'audio/aac':                                                                            MimeType{'iana', [], false, ''}
	'audio/ac3':                                                                            MimeType{'iana', [], false, ''}
	'audio/adpcm':                                                                          MimeType{'apache', [
		'adp',
	], false, ''}
	'audio/amr':                                                                            MimeType{'iana', [], false, ''}
	'audio/amr-wb':                                                                         MimeType{'iana', [], false, ''}
	'audio/amr-wb+':                                                                        MimeType{'iana', [], false, ''}
	'audio/aptx':                                                                           MimeType{'iana', [], false, ''}
	'audio/asc':                                                                            MimeType{'iana', [], false, ''}
	'audio/atrac-advanced-lossless':                                                        MimeType{'iana', [], false, ''}
	'audio/atrac-x':                                                                        MimeType{'iana', [], false, ''}
	'audio/atrac3':                                                                         MimeType{'iana', [], false, ''}
	'audio/basic':                                                                          MimeType{'iana', [
		'au',
		'snd',
	], false, ''}
	'audio/bv16':                                                                           MimeType{'iana', [], false, ''}
	'audio/bv32':                                                                           MimeType{'iana', [], false, ''}
	'audio/clearmode':                                                                      MimeType{'iana', [], false, ''}
	'audio/cn':                                                                             MimeType{'iana', [], false, ''}
	'audio/dat12':                                                                          MimeType{'iana', [], false, ''}
	'audio/dls':                                                                            MimeType{'iana', [], false, ''}
	'audio/dsr-es201108':                                                                   MimeType{'iana', [], false, ''}
	'audio/dsr-es202050':                                                                   MimeType{'iana', [], false, ''}
	'audio/dsr-es202211':                                                                   MimeType{'iana', [], false, ''}
	'audio/dsr-es202212':                                                                   MimeType{'iana', [], false, ''}
	'audio/dv':                                                                             MimeType{'iana', [], false, ''}
	'audio/dvi4':                                                                           MimeType{'iana', [], false, ''}
	'audio/eac3':                                                                           MimeType{'iana', [], false, ''}
	'audio/encaprtp':                                                                       MimeType{'iana', [], false, ''}
	'audio/evrc':                                                                           MimeType{'iana', [], false, ''}
	'audio/evrc-qcp':                                                                       MimeType{'iana', [], false, ''}
	'audio/evrc0':                                                                          MimeType{'iana', [], false, ''}
	'audio/evrc1':                                                                          MimeType{'iana', [], false, ''}
	'audio/evrcb':                                                                          MimeType{'iana', [], false, ''}
	'audio/evrcb0':                                                                         MimeType{'iana', [], false, ''}
	'audio/evrcb1':                                                                         MimeType{'iana', [], false, ''}
	'audio/evrcnw':                                                                         MimeType{'iana', [], false, ''}
	'audio/evrcnw0':                                                                        MimeType{'iana', [], false, ''}
	'audio/evrcnw1':                                                                        MimeType{'iana', [], false, ''}
	'audio/evrcwb':                                                                         MimeType{'iana', [], false, ''}
	'audio/evrcwb0':                                                                        MimeType{'iana', [], false, ''}
	'audio/evrcwb1':                                                                        MimeType{'iana', [], false, ''}
	'audio/evs':                                                                            MimeType{'iana', [], false, ''}
	'audio/fwdred':                                                                         MimeType{'iana', [], false, ''}
	'audio/g711-0':                                                                         MimeType{'iana', [], false, ''}
	'audio/g719':                                                                           MimeType{'iana', [], false, ''}
	'audio/g722':                                                                           MimeType{'iana', [], false, ''}
	'audio/g7221':                                                                          MimeType{'iana', [], false, ''}
	'audio/g723':                                                                           MimeType{'iana', [], false, ''}
	'audio/g726-16':                                                                        MimeType{'iana', [], false, ''}
	'audio/g726-24':                                                                        MimeType{'iana', [], false, ''}
	'audio/g726-32':                                                                        MimeType{'iana', [], false, ''}
	'audio/g726-40':                                                                        MimeType{'iana', [], false, ''}
	'audio/g728':                                                                           MimeType{'iana', [], false, ''}
	'audio/g729':                                                                           MimeType{'iana', [], false, ''}
	'audio/g7291':                                                                          MimeType{'iana', [], false, ''}
	'audio/g729d':                                                                          MimeType{'iana', [], false, ''}
	'audio/g729e':                                                                          MimeType{'iana', [], false, ''}
	'audio/gsm':                                                                            MimeType{'iana', [], false, ''}
	'audio/gsm-efr':                                                                        MimeType{'iana', [], false, ''}
	'audio/gsm-hr-08':                                                                      MimeType{'iana', [], false, ''}
	'audio/ilbc':                                                                           MimeType{'iana', [], false, ''}
	'audio/ip-mr_v2.5':                                                                     MimeType{'iana', [], false, ''}
	'audio/isac':                                                                           MimeType{'apache', [], false, ''}
	'audio/l16':                                                                            MimeType{'iana', [], false, ''}
	'audio/l20':                                                                            MimeType{'iana', [], false, ''}
	'audio/l24':                                                                            MimeType{'iana', [], false, ''}
	'audio/l8':                                                                             MimeType{'iana', [], false, ''}
	'audio/lpc':                                                                            MimeType{'iana', [], false, ''}
	'audio/melp':                                                                           MimeType{'iana', [], false, ''}
	'audio/melp1200':                                                                       MimeType{'iana', [], false, ''}
	'audio/melp2400':                                                                       MimeType{'iana', [], false, ''}
	'audio/melp600':                                                                        MimeType{'iana', [], false, ''}
	'audio/midi':                                                                           MimeType{'apache', [
		'mid',
		'midi',
		'kar',
		'rmi',
	], false, ''}
	'audio/mobile-xmf':                                                                     MimeType{'iana', [], false, ''}
	'audio/mp3':                                                                            MimeType{'', [
		'mp3',
	], false, ''}
	'audio/mp4':                                                                            MimeType{'iana', [
		'm4a',
		'mp4a',
	], false, ''}
	'audio/mp4a-latm':                                                                      MimeType{'iana', [], false, ''}
	'audio/mpa':                                                                            MimeType{'iana', [], false, ''}
	'audio/mpa-robust':                                                                     MimeType{'iana', [], false, ''}
	'audio/mpeg':                                                                           MimeType{'iana', [
		'mpga',
		'mp2',
		'mp2a',
		'mp3',
		'm2a',
		'm3a',
	], false, ''}
	'audio/mpeg4-generic':                                                                  MimeType{'iana', [], false, ''}
	'audio/musepack':                                                                       MimeType{'apache', [], false, ''}
	'audio/ogg':                                                                            MimeType{'iana', [
		'oga',
		'ogg',
		'spx',
	], false, ''}
	'audio/opus':                                                                           MimeType{'iana', [], false, ''}
	'audio/parityfec':                                                                      MimeType{'iana', [], false, ''}
	'audio/pcma':                                                                           MimeType{'iana', [], false, ''}
	'audio/pcma-wb':                                                                        MimeType{'iana', [], false, ''}
	'audio/pcmu':                                                                           MimeType{'iana', [], false, ''}
	'audio/pcmu-wb':                                                                        MimeType{'iana', [], false, ''}
	'audio/prs.sid':                                                                        MimeType{'iana', [], false, ''}
	'audio/qcelp':                                                                          MimeType{'iana', [], false, ''}
	'audio/raptorfec':                                                                      MimeType{'iana', [], false, ''}
	'audio/red':                                                                            MimeType{'iana', [], false, ''}
	'audio/rtp-enc-aescm128':                                                               MimeType{'iana', [], false, ''}
	'audio/rtp-midi':                                                                       MimeType{'iana', [], false, ''}
	'audio/rtploopback':                                                                    MimeType{'iana', [], false, ''}
	'audio/rtx':                                                                            MimeType{'iana', [], false, ''}
	'audio/s3m':                                                                            MimeType{'apache', [
		's3m',
	], false, ''}
	'audio/silk':                                                                           MimeType{'apache', [
		'sil',
	], false, ''}
	'audio/smv':                                                                            MimeType{'iana', [], false, ''}
	'audio/smv-qcp':                                                                        MimeType{'iana', [], false, ''}
	'audio/smv0':                                                                           MimeType{'iana', [], false, ''}
	'audio/sp-midi':                                                                        MimeType{'iana', [], false, ''}
	'audio/speex':                                                                          MimeType{'iana', [], false, ''}
	'audio/t140c':                                                                          MimeType{'iana', [], false, ''}
	'audio/t38':                                                                            MimeType{'iana', [], false, ''}
	'audio/telephone-event':                                                                MimeType{'iana', [], false, ''}
	'audio/tetra_acelp':                                                                    MimeType{'iana', [], false, ''}
	'audio/tone':                                                                           MimeType{'iana', [], false, ''}
	'audio/uemclip':                                                                        MimeType{'iana', [], false, ''}
	'audio/ulpfec':                                                                         MimeType{'iana', [], false, ''}
	'audio/usac':                                                                           MimeType{'iana', [], false, ''}
	'audio/vdvi':                                                                           MimeType{'iana', [], false, ''}
	'audio/vmr-wb':                                                                         MimeType{'iana', [], false, ''}
	'audio/vnd.3gpp.iufp':                                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.4sb':                                                                        MimeType{'iana', [], false, ''}
	'audio/vnd.audiokoz':                                                                   MimeType{'iana', [], false, ''}
	'audio/vnd.celp':                                                                       MimeType{'iana', [], false, ''}
	'audio/vnd.cisco.nse':                                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.cmles.radio-events':                                                         MimeType{'iana', [], false, ''}
	'audio/vnd.cns.anp1':                                                                   MimeType{'iana', [], false, ''}
	'audio/vnd.cns.inf1':                                                                   MimeType{'iana', [], false, ''}
	'audio/vnd.dece.audio':                                                                 MimeType{'iana', [
		'uva',
		'uvva',
	], false, ''}
	'audio/vnd.digital-winds':                                                              MimeType{'iana', [
		'eol',
	], false, ''}
	'audio/vnd.dlna.adts':                                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.dolby.heaac.1':                                                              MimeType{'iana', [], false, ''}
	'audio/vnd.dolby.heaac.2':                                                              MimeType{'iana', [], false, ''}
	'audio/vnd.dolby.mlp':                                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.dolby.mps':                                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.dolby.pl2':                                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.dolby.pl2x':                                                                 MimeType{'iana', [], false, ''}
	'audio/vnd.dolby.pl2z':                                                                 MimeType{'iana', [], false, ''}
	'audio/vnd.dolby.pulse.1':                                                              MimeType{'iana', [], false, ''}
	'audio/vnd.dra':                                                                        MimeType{'iana', [
		'dra',
	], false, ''}
	'audio/vnd.dts':                                                                        MimeType{'iana', [
		'dts',
	], false, ''}
	'audio/vnd.dts.hd':                                                                     MimeType{'iana', [
		'dtshd',
	], false, ''}
	'audio/vnd.dts.uhd':                                                                    MimeType{'iana', [], false, ''}
	'audio/vnd.dvb.file':                                                                   MimeType{'iana', [], false, ''}
	'audio/vnd.everad.plj':                                                                 MimeType{'iana', [], false, ''}
	'audio/vnd.hns.audio':                                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.lucent.voice':                                                               MimeType{'iana', [
		'lvp',
	], false, ''}
	'audio/vnd.ms-playready.media.pya':                                                     MimeType{'iana', [
		'pya',
	], false, ''}
	'audio/vnd.nokia.mobile-xmf':                                                           MimeType{'iana', [], false, ''}
	'audio/vnd.nortel.vbk':                                                                 MimeType{'iana', [], false, ''}
	'audio/vnd.nuera.ecelp4800':                                                            MimeType{'iana', [
		'ecelp4800',
	], false, ''}
	'audio/vnd.nuera.ecelp7470':                                                            MimeType{'iana', [
		'ecelp7470',
	], false, ''}
	'audio/vnd.nuera.ecelp9600':                                                            MimeType{'iana', [
		'ecelp9600',
	], false, ''}
	'audio/vnd.octel.sbc':                                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.presonus.multitrack':                                                        MimeType{'iana', [], false, ''}
	'audio/vnd.qcelp':                                                                      MimeType{'iana', [], false, ''}
	'audio/vnd.rhetorex.32kadpcm':                                                          MimeType{'iana', [], false, ''}
	'audio/vnd.rip':                                                                        MimeType{'iana', [
		'rip',
	], false, ''}
	'audio/vnd.rn-realaudio':                                                               MimeType{'', [], false, ''}
	'audio/vnd.sealedmedia.softseal.mpeg':                                                  MimeType{'iana', [], false, ''}
	'audio/vnd.vmx.cvsd':                                                                   MimeType{'iana', [], false, ''}
	'audio/vnd.wave':                                                                       MimeType{'', [], false, ''}
	'audio/vorbis':                                                                         MimeType{'iana', [], false, ''}
	'audio/vorbis-config':                                                                  MimeType{'iana', [], false, ''}
	'audio/wav':                                                                            MimeType{'', [
		'wav',
	], false, ''}
	'audio/wave':                                                                           MimeType{'', [
		'wav',
	], false, ''}
	'audio/webm':                                                                           MimeType{'apache', [
		'weba',
	], false, ''}
	'audio/x-aac':                                                                          MimeType{'apache', [
		'aac',
	], false, ''}
	'audio/x-aiff':                                                                         MimeType{'apache', [
		'aif',
		'aiff',
		'aifc',
	], false, ''}
	'audio/x-caf':                                                                          MimeType{'apache', [
		'caf',
	], false, ''}
	'audio/x-flac':                                                                         MimeType{'apache', [
		'flac',
	], false, ''}
	'audio/x-m4a':                                                                          MimeType{'nginx', [
		'm4a',
	], false, ''}
	'audio/x-matroska':                                                                     MimeType{'apache', [
		'mka',
	], false, ''}
	'audio/x-mpegurl':                                                                      MimeType{'apache', [
		'm3u',
	], false, ''}
	'audio/x-ms-wax':                                                                       MimeType{'apache', [
		'wax',
	], false, ''}
	'audio/x-ms-wma':                                                                       MimeType{'apache', [
		'wma',
	], false, ''}
	'audio/x-pn-realaudio':                                                                 MimeType{'apache', [
		'ram',
		'ra',
	], false, ''}
	'audio/x-pn-realaudio-plugin':                                                          MimeType{'apache', [
		'rmp',
	], false, ''}
	'audio/x-realaudio':                                                                    MimeType{'nginx', [
		'ra',
	], false, ''}
	'audio/x-tta':                                                                          MimeType{'apache', [], false, ''}
	'audio/x-wav':                                                                          MimeType{'apache', [
		'wav',
	], false, ''}
	'audio/xm':                                                                             MimeType{'apache', [
		'xm',
	], false, ''}
	'chemical/x-cdx':                                                                       MimeType{'apache', [
		'cdx',
	], false, ''}
	'chemical/x-cif':                                                                       MimeType{'apache', [
		'cif',
	], false, ''}
	'chemical/x-cmdf':                                                                      MimeType{'apache', [
		'cmdf',
	], false, ''}
	'chemical/x-cml':                                                                       MimeType{'apache', [
		'cml',
	], false, ''}
	'chemical/x-csml':                                                                      MimeType{'apache', [
		'csml',
	], false, ''}
	'chemical/x-pdb':                                                                       MimeType{'apache', [], false, ''}
	'chemical/x-xyz':                                                                       MimeType{'apache', [
		'xyz',
	], false, ''}
	'font/collection':                                                                      MimeType{'iana', [
		'ttc',
	], false, ''}
	'font/otf':                                                                             MimeType{'iana', [
		'otf',
	], true, ''}
	'font/sfnt':                                                                            MimeType{'iana', [], false, ''}
	'font/ttf':                                                                             MimeType{'iana', [
		'ttf',
	], false, ''}
	'font/woff':                                                                            MimeType{'iana', [
		'woff',
	], false, ''}
	'font/woff2':                                                                           MimeType{'iana', [
		'woff2',
	], false, ''}
	'image/aces':                                                                           MimeType{'iana', [
		'exr',
	], false, ''}
	'image/apng':                                                                           MimeType{'', [
		'apng',
	], false, ''}
	'image/avci':                                                                           MimeType{'iana', [], false, ''}
	'image/avcs':                                                                           MimeType{'iana', [], false, ''}
	'image/bmp':                                                                            MimeType{'iana', [
		'bmp',
	], true, ''}
	'image/cgm':                                                                            MimeType{'iana', [
		'cgm',
	], false, ''}
	'image/dicom-rle':                                                                      MimeType{'iana', [
		'drle',
	], false, ''}
	'image/emf':                                                                            MimeType{'iana', [
		'emf',
	], false, ''}
	'image/fits':                                                                           MimeType{'iana', [
		'fits',
	], false, ''}
	'image/g3fax':                                                                          MimeType{'iana', [
		'g3',
	], false, ''}
	'image/gif':                                                                            MimeType{'iana', [
		'gif',
	], false, ''}
	'image/heic':                                                                           MimeType{'iana', [
		'heic',
	], false, ''}
	'image/heic-sequence':                                                                  MimeType{'iana', [
		'heics',
	], false, ''}
	'image/heif':                                                                           MimeType{'iana', [
		'heif',
	], false, ''}
	'image/heif-sequence':                                                                  MimeType{'iana', [
		'heifs',
	], false, ''}
	'image/ief':                                                                            MimeType{'iana', [
		'ief',
	], false, ''}
	'image/jls':                                                                            MimeType{'iana', [
		'jls',
	], false, ''}
	'image/jp2':                                                                            MimeType{'iana', [
		'jp2',
		'jpg2',
	], false, ''}
	'image/jpeg':                                                                           MimeType{'iana', [
		'jpeg',
		'jpg',
		'jpe',
	], false, ''}
	'image/jpm':                                                                            MimeType{'iana', [
		'jpm',
	], false, ''}
	'image/jpx':                                                                            MimeType{'iana', [
		'jpx',
		'jpf',
	], false, ''}
	'image/jxr':                                                                            MimeType{'iana', [
		'jxr',
	], false, ''}
	'image/ktx':                                                                            MimeType{'iana', [
		'ktx',
	], false, ''}
	'image/naplps':                                                                         MimeType{'iana', [], false, ''}
	'image/pjpeg':                                                                          MimeType{'', [], false, ''}
	'image/png':                                                                            MimeType{'iana', [
		'png',
	], false, ''}
	'image/prs.btif':                                                                       MimeType{'iana', [
		'btif',
	], false, ''}
	'image/prs.pti':                                                                        MimeType{'iana', [
		'pti',
	], false, ''}
	'image/pwg-raster':                                                                     MimeType{'iana', [], false, ''}
	'image/sgi':                                                                            MimeType{'apache', [
		'sgi',
	], false, ''}
	'image/svg+xml':                                                                        MimeType{'iana', [
		'svg',
		'svgz',
	], true, ''}
	'image/t38':                                                                            MimeType{'iana', [
		't38',
	], false, ''}
	'image/tiff':                                                                           MimeType{'iana', [
		'tif',
		'tiff',
	], false, ''}
	'image/tiff-fx':                                                                        MimeType{'iana', [
		'tfx',
	], false, ''}
	'image/vnd.adobe.photoshop':                                                            MimeType{'iana', [
		'psd',
	], true, ''}
	'image/vnd.airzip.accelerator.azv':                                                     MimeType{'iana', [
		'azv',
	], false, ''}
	'image/vnd.cns.inf2':                                                                   MimeType{'iana', [], false, ''}
	'image/vnd.dece.graphic':                                                               MimeType{'iana', [
		'uvi',
		'uvvi',
		'uvg',
		'uvvg',
	], false, ''}
	'image/vnd.djvu':                                                                       MimeType{'iana', [
		'djvu',
		'djv',
	], false, ''}
	'image/vnd.dvb.subtitle':                                                               MimeType{'iana', [
		'sub',
	], false, ''}
	'image/vnd.dwg':                                                                        MimeType{'iana', [
		'dwg',
	], false, ''}
	'image/vnd.dxf':                                                                        MimeType{'iana', [
		'dxf',
	], false, ''}
	'image/vnd.fastbidsheet':                                                               MimeType{'iana', [
		'fbs',
	], false, ''}
	'image/vnd.fpx':                                                                        MimeType{'iana', [
		'fpx',
	], false, ''}
	'image/vnd.fst':                                                                        MimeType{'iana', [
		'fst',
	], false, ''}
	'image/vnd.fujixerox.edmics-mmr':                                                       MimeType{'iana', [
		'mmr',
	], false, ''}
	'image/vnd.fujixerox.edmics-rlc':                                                       MimeType{'iana', [
		'rlc',
	], false, ''}
	'image/vnd.globalgraphics.pgb':                                                         MimeType{'iana', [], false, ''}
	'image/vnd.microsoft.icon':                                                             MimeType{'iana', [
		'ico',
	], false, ''}
	'image/vnd.mix':                                                                        MimeType{'iana', [], false, ''}
	'image/vnd.mozilla.apng':                                                               MimeType{'iana', [], false, ''}
	'image/vnd.ms-modi':                                                                    MimeType{'iana', [
		'mdi',
	], false, ''}
	'image/vnd.ms-photo':                                                                   MimeType{'apache', [
		'wdp',
	], false, ''}
	'image/vnd.net-fpx':                                                                    MimeType{'iana', [
		'npx',
	], false, ''}
	'image/vnd.radiance':                                                                   MimeType{'iana', [], false, ''}
	'image/vnd.sealed.png':                                                                 MimeType{'iana', [], false, ''}
	'image/vnd.sealedmedia.softseal.gif':                                                   MimeType{'iana', [], false, ''}
	'image/vnd.sealedmedia.softseal.jpg':                                                   MimeType{'iana', [], false, ''}
	'image/vnd.svf':                                                                        MimeType{'iana', [], false, ''}
	'image/vnd.tencent.tap':                                                                MimeType{'iana', [
		'tap',
	], false, ''}
	'image/vnd.valve.source.texture':                                                       MimeType{'iana', [
		'vtf',
	], false, ''}
	'image/vnd.wap.wbmp':                                                                   MimeType{'iana', [
		'wbmp',
	], false, ''}
	'image/vnd.xiff':                                                                       MimeType{'iana', [
		'xif',
	], false, ''}
	'image/vnd.zbrush.pcx':                                                                 MimeType{'iana', [
		'pcx',
	], false, ''}
	'image/webp':                                                                           MimeType{'apache', [
		'webp',
	], false, ''}
	'image/wmf':                                                                            MimeType{'iana', [
		'wmf',
	], false, ''}
	'image/x-3ds':                                                                          MimeType{'apache', [
		'3ds',
	], false, ''}
	'image/x-cmu-raster':                                                                   MimeType{'apache', [
		'ras',
	], false, ''}
	'image/x-cmx':                                                                          MimeType{'apache', [
		'cmx',
	], false, ''}
	'image/x-freehand':                                                                     MimeType{'apache', [
		'fh',
		'fhc',
		'fh4',
		'fh5',
		'fh7',
	], false, ''}
	'image/x-icon':                                                                         MimeType{'apache', [
		'ico',
	], true, ''}
	'image/x-jng':                                                                          MimeType{'nginx', [
		'jng',
	], false, ''}
	'image/x-mrsid-image':                                                                  MimeType{'apache', [
		'sid',
	], false, ''}
	'image/x-ms-bmp':                                                                       MimeType{'nginx', [
		'bmp',
	], true, ''}
	'image/x-pcx':                                                                          MimeType{'apache', [
		'pcx',
	], false, ''}
	'image/x-pict':                                                                         MimeType{'apache', [
		'pic',
		'pct',
	], false, ''}
	'image/x-portable-anymap':                                                              MimeType{'apache', [
		'pnm',
	], false, ''}
	'image/x-portable-bitmap':                                                              MimeType{'apache', [
		'pbm',
	], false, ''}
	'image/x-portable-graymap':                                                             MimeType{'apache', [
		'pgm',
	], false, ''}
	'image/x-portable-pixmap':                                                              MimeType{'apache', [
		'ppm',
	], false, ''}
	'image/x-rgb':                                                                          MimeType{'apache', [
		'rgb',
	], false, ''}
	'image/x-tga':                                                                          MimeType{'apache', [
		'tga',
	], false, ''}
	'image/x-xbitmap':                                                                      MimeType{'apache', [
		'xbm',
	], false, ''}
	'image/x-xcf':                                                                          MimeType{'', [], false, ''}
	'image/x-xpixmap':                                                                      MimeType{'apache', [
		'xpm',
	], false, ''}
	'image/x-xwindowdump':                                                                  MimeType{'apache', [
		'xwd',
	], false, ''}
	'message/cpim':                                                                         MimeType{'iana', [], false, ''}
	'message/delivery-status':                                                              MimeType{'iana', [], false, ''}
	'message/disposition-notification':                                                     MimeType{'iana', [
		'disposition-notification',
	], false, ''}
	'message/external-body':                                                                MimeType{'iana', [], false, ''}
	'message/feedback-report':                                                              MimeType{'iana', [], false, ''}
	'message/global':                                                                       MimeType{'iana', [
		'u8msg',
	], false, ''}
	'message/global-delivery-status':                                                       MimeType{'iana', [
		'u8dsn',
	], false, ''}
	'message/global-disposition-notification':                                              MimeType{'iana', [
		'u8mdn',
	], false, ''}
	'message/global-headers':                                                               MimeType{'iana', [
		'u8hdr',
	], false, ''}
	'message/http':                                                                         MimeType{'iana', [], false, ''}
	'message/imdn+xml':                                                                     MimeType{'iana', [], true, ''}
	'message/news':                                                                         MimeType{'iana', [], false, ''}
	'message/partial':                                                                      MimeType{'iana', [], false, ''}
	'message/rfc822':                                                                       MimeType{'iana', [
		'eml',
		'mime',
	], true, ''}
	'message/s-http':                                                                       MimeType{'iana', [], false, ''}
	'message/sip':                                                                          MimeType{'iana', [], false, ''}
	'message/sipfrag':                                                                      MimeType{'iana', [], false, ''}
	'message/tracking-status':                                                              MimeType{'iana', [], false, ''}
	'message/vnd.si.simp':                                                                  MimeType{'iana', [], false, ''}
	'message/vnd.wfa.wsc':                                                                  MimeType{'iana', [
		'wsc',
	], false, ''}
	'model/3mf':                                                                            MimeType{'iana', [
		'3mf',
	], false, ''}
	'model/gltf+json':                                                                      MimeType{'iana', [
		'gltf',
	], true, ''}
	'model/gltf-binary':                                                                    MimeType{'iana', [
		'glb',
	], true, ''}
	'model/iges':                                                                           MimeType{'iana', [
		'igs',
		'iges',
	], false, ''}
	'model/mesh':                                                                           MimeType{'iana', [
		'msh',
		'mesh',
		'silo',
	], false, ''}
	'model/stl':                                                                            MimeType{'iana', [
		'stl',
	], false, ''}
	'model/vnd.collada+xml':                                                                MimeType{'iana', [
		'dae',
	], true, ''}
	'model/vnd.dwf':                                                                        MimeType{'iana', [
		'dwf',
	], false, ''}
	'model/vnd.flatland.3dml':                                                              MimeType{'iana', [], false, ''}
	'model/vnd.gdl':                                                                        MimeType{'iana', [
		'gdl',
	], false, ''}
	'model/vnd.gs-gdl':                                                                     MimeType{'apache', [], false, ''}
	'model/vnd.gs.gdl':                                                                     MimeType{'iana', [], false, ''}
	'model/vnd.gtw':                                                                        MimeType{'iana', [
		'gtw',
	], false, ''}
	'model/vnd.moml+xml':                                                                   MimeType{'iana', [], true, ''}
	'model/vnd.mts':                                                                        MimeType{'iana', [
		'mts',
	], false, ''}
	'model/vnd.opengex':                                                                    MimeType{'iana', [
		'ogex',
	], false, ''}
	'model/vnd.parasolid.transmit.binary':                                                  MimeType{'iana', [
		'x_b',
	], false, ''}
	'model/vnd.parasolid.transmit.text':                                                    MimeType{'iana', [
		'x_t',
	], false, ''}
	'model/vnd.rosette.annotated-data-model':                                               MimeType{'iana', [], false, ''}
	'model/vnd.usdz+zip':                                                                   MimeType{'iana', [
		'usdz',
	], false, ''}
	'model/vnd.valve.source.compiled-map':                                                  MimeType{'iana', [
		'bsp',
	], false, ''}
	'model/vnd.vtu':                                                                        MimeType{'iana', [
		'vtu',
	], false, ''}
	'model/vrml':                                                                           MimeType{'iana', [
		'wrl',
		'vrml',
	], false, ''}
	'model/x3d+binary':                                                                     MimeType{'apache', [
		'x3db',
		'x3dbz',
	], false, ''}
	'model/x3d+fastinfoset':                                                                MimeType{'iana', [
		'x3db',
	], false, ''}
	'model/x3d+vrml':                                                                       MimeType{'apache', [
		'x3dv',
		'x3dvz',
	], false, ''}
	'model/x3d+xml':                                                                        MimeType{'iana', [
		'x3d',
		'x3dz',
	], true, ''}
	'model/x3d-vrml':                                                                       MimeType{'iana', [
		'x3dv',
	], false, ''}
	'multipart/alternative':                                                                MimeType{'iana', [], false, ''}
	'multipart/appledouble':                                                                MimeType{'iana', [], false, ''}
	'multipart/byteranges':                                                                 MimeType{'iana', [], false, ''}
	'multipart/digest':                                                                     MimeType{'iana', [], false, ''}
	'multipart/encrypted':                                                                  MimeType{'iana', [], false, ''}
	'multipart/form-data':                                                                  MimeType{'iana', [], false, ''}
	'multipart/header-set':                                                                 MimeType{'iana', [], false, ''}
	'multipart/mixed':                                                                      MimeType{'iana', [], false, ''}
	'multipart/multilingual':                                                               MimeType{'iana', [], false, ''}
	'multipart/parallel':                                                                   MimeType{'iana', [], false, ''}
	'multipart/related':                                                                    MimeType{'iana', [], false, ''}
	'multipart/report':                                                                     MimeType{'iana', [], false, ''}
	'multipart/signed':                                                                     MimeType{'iana', [], false, ''}
	'multipart/vnd.bint.med-plus':                                                          MimeType{'iana', [], false, ''}
	'multipart/voice-message':                                                              MimeType{'iana', [], false, ''}
	'multipart/x-mixed-replace':                                                            MimeType{'iana', [], false, ''}
	'text/1d-interleaved-parityfec':                                                        MimeType{'iana', [], false, ''}
	'text/cache-manifest':                                                                  MimeType{'iana', [
		'appcache',
		'manifest',
	], true, ''}
	'text/calendar':                                                                        MimeType{'iana', [
		'ics',
		'ifb',
	], false, ''}
	'text/calender':                                                                        MimeType{'', [], true, ''}
	'text/cmd':                                                                             MimeType{'', [], true, ''}
	'text/coffeescript':                                                                    MimeType{'', [
		'coffee',
		'litcoffee',
	], false, ''}
	'text/css':                                                                             MimeType{'iana', [
		'css',
	], true, 'UTF-8'}
	'text/csv':                                                                             MimeType{'iana', [
		'csv',
	], true, ''}
	'text/csv-schema':                                                                      MimeType{'iana', [], false, ''}
	'text/directory':                                                                       MimeType{'iana', [], false, ''}
	'text/dns':                                                                             MimeType{'iana', [], false, ''}
	'text/ecmascript':                                                                      MimeType{'iana', [], false, ''}
	'text/encaprtp':                                                                        MimeType{'iana', [], false, ''}
	'text/enriched':                                                                        MimeType{'iana', [], false, ''}
	'text/fwdred':                                                                          MimeType{'iana', [], false, ''}
	'text/grammar-ref-list':                                                                MimeType{'iana', [], false, ''}
	'text/html':                                                                            MimeType{'iana', [
		'html',
		'htm',
		'shtml',
	], true, ''}
	'text/jade':                                                                            MimeType{'', [
		'jade',
	], false, ''}
	'text/javascript':                                                                      MimeType{'iana', [], true, ''}
	'text/jcr-cnd':                                                                         MimeType{'iana', [], false, ''}
	'text/jsx':                                                                             MimeType{'', [
		'jsx',
	], true, ''}
	'text/less':                                                                            MimeType{'', [
		'less',
	], true, ''}
	'text/markdown':                                                                        MimeType{'iana', [
		'markdown',
		'md',
	], true, ''}
	'text/mathml':                                                                          MimeType{'nginx', [
		'mml',
	], false, ''}
	'text/mdx':                                                                             MimeType{'', [
		'mdx',
	], true, ''}
	'text/mizar':                                                                           MimeType{'iana', [], false, ''}
	'text/n3':                                                                              MimeType{'iana', [
		'n3',
	], true, ''}
	'text/parameters':                                                                      MimeType{'iana', [], false, ''}
	'text/parityfec':                                                                       MimeType{'iana', [], false, ''}
	'text/plain':                                                                           MimeType{'iana', [
		'txt',
		'text',
		'conf',
		'def',
		'list',
		'log',
		'in',
		'ini',
	], true, ''}
	'text/provenance-notation':                                                             MimeType{'iana', [], false, ''}
	'text/prs.fallenstein.rst':                                                             MimeType{'iana', [], false, ''}
	'text/prs.lines.tag':                                                                   MimeType{'iana', [
		'dsc',
	], false, ''}
	'text/prs.prop.logic':                                                                  MimeType{'iana', [], false, ''}
	'text/raptorfec':                                                                       MimeType{'iana', [], false, ''}
	'text/red':                                                                             MimeType{'iana', [], false, ''}
	'text/rfc822-headers':                                                                  MimeType{'iana', [], false, ''}
	'text/richtext':                                                                        MimeType{'iana', [
		'rtx',
	], true, ''}
	'text/rtf':                                                                             MimeType{'iana', [
		'rtf',
	], true, ''}
	'text/rtp-enc-aescm128':                                                                MimeType{'iana', [], false, ''}
	'text/rtploopback':                                                                     MimeType{'iana', [], false, ''}
	'text/rtx':                                                                             MimeType{'iana', [], false, ''}
	'text/sgml':                                                                            MimeType{'iana', [
		'sgml',
		'sgm',
	], false, ''}
	'text/shex':                                                                            MimeType{'', [
		'shex',
	], false, ''}
	'text/slim':                                                                            MimeType{'', [
		'slim',
		'slm',
	], false, ''}
	'text/strings':                                                                         MimeType{'iana', [], false, ''}
	'text/stylus':                                                                          MimeType{'', [
		'stylus',
		'styl',
	], false, ''}
	'text/t140':                                                                            MimeType{'iana', [], false, ''}
	'text/tab-separated-values':                                                            MimeType{'iana', [
		'tsv',
	], true, ''}
	'text/troff':                                                                           MimeType{'iana', [
		't',
		'tr',
		'roff',
		'man',
		'me',
		'ms',
	], false, ''}
	'text/turtle':                                                                          MimeType{'iana', [
		'ttl',
	], false, 'UTF-8'}
	'text/ulpfec':                                                                          MimeType{'iana', [], false, ''}
	'text/uri-list':                                                                        MimeType{'iana', [
		'uri',
		'uris',
		'urls',
	], true, ''}
	'text/vcard':                                                                           MimeType{'iana', [
		'vcard',
	], true, ''}
	'text/vnd.a':                                                                           MimeType{'iana', [], false, ''}
	'text/vnd.abc':                                                                         MimeType{'iana', [], false, ''}
	'text/vnd.ascii-art':                                                                   MimeType{'iana', [], false, ''}
	'text/vnd.curl':                                                                        MimeType{'iana', [
		'curl',
	], false, ''}
	'text/vnd.curl.dcurl':                                                                  MimeType{'apache', [
		'dcurl',
	], false, ''}
	'text/vnd.curl.mcurl':                                                                  MimeType{'apache', [
		'mcurl',
	], false, ''}
	'text/vnd.curl.scurl':                                                                  MimeType{'apache', [
		'scurl',
	], false, ''}
	'text/vnd.debian.copyright':                                                            MimeType{'iana', [], false, ''}
	'text/vnd.dmclientscript':                                                              MimeType{'iana', [], false, ''}
	'text/vnd.dvb.subtitle':                                                                MimeType{'iana', [
		'sub',
	], false, ''}
	'text/vnd.esmertec.theme-descriptor':                                                   MimeType{'iana', [], false, ''}
	'text/vnd.fly':                                                                         MimeType{'iana', [
		'fly',
	], false, ''}
	'text/vnd.fmi.flexstor':                                                                MimeType{'iana', [
		'flx',
	], false, ''}
	'text/vnd.gml':                                                                         MimeType{'iana', [], false, ''}
	'text/vnd.graphviz':                                                                    MimeType{'iana', [
		'gv',
	], false, ''}
	'text/vnd.hgl':                                                                         MimeType{'iana', [], false, ''}
	'text/vnd.in3d.3dml':                                                                   MimeType{'iana', [
		'3dml',
	], false, ''}
	'text/vnd.in3d.spot':                                                                   MimeType{'iana', [
		'spot',
	], false, ''}
	'text/vnd.iptc.newsml':                                                                 MimeType{'iana', [], false, ''}
	'text/vnd.iptc.nitf':                                                                   MimeType{'iana', [], false, ''}
	'text/vnd.latex-z':                                                                     MimeType{'iana', [], false, ''}
	'text/vnd.motorola.reflex':                                                             MimeType{'iana', [], false, ''}
	'text/vnd.ms-mediapackage':                                                             MimeType{'iana', [], false, ''}
	'text/vnd.net2phone.commcenter.command':                                                MimeType{'iana', [], false, ''}
	'text/vnd.radisys.msml-basic-layout':                                                   MimeType{'iana', [], false, ''}
	'text/vnd.senx.warpscript':                                                             MimeType{'iana', [], false, ''}
	'text/vnd.si.uricatalogue':                                                             MimeType{'iana', [], false, ''}
	'text/vnd.sun.j2me.app-descriptor':                                                     MimeType{'iana', [
		'jad',
	], false, ''}
	'text/vnd.trolltech.linguist':                                                          MimeType{'iana', [], false, ''}
	'text/vnd.wap.si':                                                                      MimeType{'iana', [], false, ''}
	'text/vnd.wap.sl':                                                                      MimeType{'iana', [], false, ''}
	'text/vnd.wap.wml':                                                                     MimeType{'iana', [
		'wml',
	], false, ''}
	'text/vnd.wap.wmlscript':                                                               MimeType{'iana', [
		'wmls',
	], false, ''}
	'text/vtt':                                                                             MimeType{'', [
		'vtt',
	], true, 'UTF-8'}
	'text/x-asm':                                                                           MimeType{'apache', [
		's',
		'asm',
	], false, ''}
	'text/x-c':                                                                             MimeType{'apache', [
		'c',
		'cc',
		'cxx',
		'cpp',
		'h',
		'hh',
		'dic',
	], false, ''}
	'text/x-component':                                                                     MimeType{'nginx', [
		'htc',
	], false, ''}
	'text/x-fortran':                                                                       MimeType{'apache', [
		'f',
		'for',
		'f77',
		'f90',
	], false, ''}
	'text/x-gwt-rpc':                                                                       MimeType{'', [], true, ''}
	'text/x-handlebars-template':                                                           MimeType{'', [
		'hbs',
	], false, ''}
	'text/x-java-source':                                                                   MimeType{'apache', [
		'java',
	], false, ''}
	'text/x-jquery-tmpl':                                                                   MimeType{'', [], true, ''}
	'text/x-lua':                                                                           MimeType{'', [
		'lua',
	], false, ''}
	'text/x-markdown':                                                                      MimeType{'', [
		'mkd',
	], true, ''}
	'text/x-nfo':                                                                           MimeType{'apache', [
		'nfo',
	], false, ''}
	'text/x-opml':                                                                          MimeType{'apache', [
		'opml',
	], false, ''}
	'text/x-org':                                                                           MimeType{'', [
		'org',
	], true, ''}
	'text/x-pascal':                                                                        MimeType{'apache', [
		'p',
		'pas',
	], false, ''}
	'text/x-processing':                                                                    MimeType{'', [
		'pde',
	], true, ''}
	'text/x-sass':                                                                          MimeType{'', [
		'sass',
	], false, ''}
	'text/x-scss':                                                                          MimeType{'', [
		'scss',
	], false, ''}
	'text/x-setext':                                                                        MimeType{'apache', [
		'etx',
	], false, ''}
	'text/x-sfv':                                                                           MimeType{'apache', [
		'sfv',
	], false, ''}
	'text/x-suse-ymp':                                                                      MimeType{'', [
		'ymp',
	], true, ''}
	'text/x-uuencode':                                                                      MimeType{'apache', [
		'uu',
	], false, ''}
	'text/x-vcalendar':                                                                     MimeType{'apache', [
		'vcs',
	], false, ''}
	'text/x-vcard':                                                                         MimeType{'apache', [
		'vcf',
	], false, ''}
	'text/xml':                                                                             MimeType{'iana', [
		'xml',
	], true, ''}
	'text/xml-external-parsed-entity':                                                      MimeType{'iana', [], false, ''}
	'text/yaml':                                                                            MimeType{'', [
		'yaml',
		'yml',
	], false, ''}
	'video/1d-interleaved-parityfec':                                                       MimeType{'iana', [], false, ''}
	'video/3gpp':                                                                           MimeType{'iana', [
		'3gp',
		'3gpp',
	], false, ''}
	'video/3gpp-tt':                                                                        MimeType{'iana', [], false, ''}
	'video/3gpp2':                                                                          MimeType{'iana', [
		'3g2',
	], false, ''}
	'video/bmpeg':                                                                          MimeType{'iana', [], false, ''}
	'video/bt656':                                                                          MimeType{'iana', [], false, ''}
	'video/celb':                                                                           MimeType{'iana', [], false, ''}
	'video/dv':                                                                             MimeType{'iana', [], false, ''}
	'video/encaprtp':                                                                       MimeType{'iana', [], false, ''}
	'video/h261':                                                                           MimeType{'iana', [
		'h261',
	], false, ''}
	'video/h263':                                                                           MimeType{'iana', [
		'h263',
	], false, ''}
	'video/h263-1998':                                                                      MimeType{'iana', [], false, ''}
	'video/h263-2000':                                                                      MimeType{'iana', [], false, ''}
	'video/h264':                                                                           MimeType{'iana', [
		'h264',
	], false, ''}
	'video/h264-rcdo':                                                                      MimeType{'iana', [], false, ''}
	'video/h264-svc':                                                                       MimeType{'iana', [], false, ''}
	'video/h265':                                                                           MimeType{'iana', [], false, ''}
	'video/iso.segment':                                                                    MimeType{'iana', [], false, ''}
	'video/jpeg':                                                                           MimeType{'iana', [
		'jpgv',
	], false, ''}
	'video/jpeg2000':                                                                       MimeType{'iana', [], false, ''}
	'video/jpm':                                                                            MimeType{'apache', [
		'jpm',
		'jpgm',
	], false, ''}
	'video/mj2':                                                                            MimeType{'iana', [
		'mj2',
		'mjp2',
	], false, ''}
	'video/mp1s':                                                                           MimeType{'iana', [], false, ''}
	'video/mp2p':                                                                           MimeType{'iana', [], false, ''}
	'video/mp2t':                                                                           MimeType{'iana', [
		'ts',
	], false, ''}
	'video/mp4':                                                                            MimeType{'iana', [
		'mp4',
		'mp4v',
		'mpg4',
	], false, ''}
	'video/mp4v-es':                                                                        MimeType{'iana', [], false, ''}
	'video/mpeg':                                                                           MimeType{'iana', [
		'mpeg',
		'mpg',
		'mpe',
		'm1v',
		'm2v',
	], false, ''}
	'video/mpeg4-generic':                                                                  MimeType{'iana', [], false, ''}
	'video/mpv':                                                                            MimeType{'iana', [], false, ''}
	'video/nv':                                                                             MimeType{'iana', [], false, ''}
	'video/ogg':                                                                            MimeType{'iana', [
		'ogv',
	], false, ''}
	'video/parityfec':                                                                      MimeType{'iana', [], false, ''}
	'video/pointer':                                                                        MimeType{'iana', [], false, ''}
	'video/quicktime':                                                                      MimeType{'iana', [
		'qt',
		'mov',
	], false, ''}
	'video/raptorfec':                                                                      MimeType{'iana', [], false, ''}
	'video/raw':                                                                            MimeType{'iana', [], false, ''}
	'video/rtp-enc-aescm128':                                                               MimeType{'iana', [], false, ''}
	'video/rtploopback':                                                                    MimeType{'iana', [], false, ''}
	'video/rtx':                                                                            MimeType{'iana', [], false, ''}
	'video/smpte291':                                                                       MimeType{'iana', [], false, ''}
	'video/smpte292m':                                                                      MimeType{'iana', [], false, ''}
	'video/ulpfec':                                                                         MimeType{'iana', [], false, ''}
	'video/vc1':                                                                            MimeType{'iana', [], false, ''}
	'video/vc2':                                                                            MimeType{'iana', [], false, ''}
	'video/vnd.cctv':                                                                       MimeType{'iana', [], false, ''}
	'video/vnd.dece.hd':                                                                    MimeType{'iana', [
		'uvh',
		'uvvh',
	], false, ''}
	'video/vnd.dece.mobile':                                                                MimeType{'iana', [
		'uvm',
		'uvvm',
	], false, ''}
	'video/vnd.dece.mp4':                                                                   MimeType{'iana', [], false, ''}
	'video/vnd.dece.pd':                                                                    MimeType{'iana', [
		'uvp',
		'uvvp',
	], false, ''}
	'video/vnd.dece.sd':                                                                    MimeType{'iana', [
		'uvs',
		'uvvs',
	], false, ''}
	'video/vnd.dece.video':                                                                 MimeType{'iana', [
		'uvv',
		'uvvv',
	], false, ''}
	'video/vnd.directv.mpeg':                                                               MimeType{'iana', [], false, ''}
	'video/vnd.directv.mpeg-tts':                                                           MimeType{'iana', [], false, ''}
	'video/vnd.dlna.mpeg-tts':                                                              MimeType{'iana', [], false, ''}
	'video/vnd.dvb.file':                                                                   MimeType{'iana', [
		'dvb',
	], false, ''}
	'video/vnd.fvt':                                                                        MimeType{'iana', [
		'fvt',
	], false, ''}
	'video/vnd.hns.video':                                                                  MimeType{'iana', [], false, ''}
	'video/vnd.iptvforum.1dparityfec-1010':                                                 MimeType{'iana', [], false, ''}
	'video/vnd.iptvforum.1dparityfec-2005':                                                 MimeType{'iana', [], false, ''}
	'video/vnd.iptvforum.2dparityfec-1010':                                                 MimeType{'iana', [], false, ''}
	'video/vnd.iptvforum.2dparityfec-2005':                                                 MimeType{'iana', [], false, ''}
	'video/vnd.iptvforum.ttsavc':                                                           MimeType{'iana', [], false, ''}
	'video/vnd.iptvforum.ttsmpeg2':                                                         MimeType{'iana', [], false, ''}
	'video/vnd.motorola.video':                                                             MimeType{'iana', [], false, ''}
	'video/vnd.motorola.videop':                                                            MimeType{'iana', [], false, ''}
	'video/vnd.mpegurl':                                                                    MimeType{'iana', [
		'mxu',
		'm4u',
	], false, ''}
	'video/vnd.ms-playready.media.pyv':                                                     MimeType{'iana', [
		'pyv',
	], false, ''}
	'video/vnd.nokia.interleaved-multimedia':                                               MimeType{'iana', [], false, ''}
	'video/vnd.nokia.mp4vr':                                                                MimeType{'iana', [], false, ''}
	'video/vnd.nokia.videovoip':                                                            MimeType{'iana', [], false, ''}
	'video/vnd.objectvideo':                                                                MimeType{'iana', [], false, ''}
	'video/vnd.radgamettools.bink':                                                         MimeType{'iana', [], false, ''}
	'video/vnd.radgamettools.smacker':                                                      MimeType{'iana', [], false, ''}
	'video/vnd.sealed.mpeg1':                                                               MimeType{'iana', [], false, ''}
	'video/vnd.sealed.mpeg4':                                                               MimeType{'iana', [], false, ''}
	'video/vnd.sealed.swf':                                                                 MimeType{'iana', [], false, ''}
	'video/vnd.sealedmedia.softseal.mov':                                                   MimeType{'iana', [], false, ''}
	'video/vnd.uvvu.mp4':                                                                   MimeType{'iana', [
		'uvu',
		'uvvu',
	], false, ''}
	'video/vnd.vivo':                                                                       MimeType{'iana', [
		'viv',
	], false, ''}
	'video/vp8':                                                                            MimeType{'iana', [], false, ''}
	'video/webm':                                                                           MimeType{'apache', [
		'webm',
	], false, ''}
	'video/x-f4v':                                                                          MimeType{'apache', [
		'f4v',
	], false, ''}
	'video/x-fli':                                                                          MimeType{'apache', [
		'fli',
	], false, ''}
	'video/x-flv':                                                                          MimeType{'apache', [
		'flv',
	], false, ''}
	'video/x-m4v':                                                                          MimeType{'apache', [
		'm4v',
	], false, ''}
	'video/x-matroska':                                                                     MimeType{'apache', [
		'mkv',
		'mk3d',
		'mks',
	], false, ''}
	'video/x-mng':                                                                          MimeType{'apache', [
		'mng',
	], false, ''}
	'video/x-ms-asf':                                                                       MimeType{'apache', [
		'asf',
		'asx',
	], false, ''}
	'video/x-ms-vob':                                                                       MimeType{'apache', [
		'vob',
	], false, ''}
	'video/x-ms-wm':                                                                        MimeType{'apache', [
		'wm',
	], false, ''}
	'video/x-ms-wmv':                                                                       MimeType{'apache', [
		'wmv',
	], false, ''}
	'video/x-ms-wmx':                                                                       MimeType{'apache', [
		'wmx',
	], false, ''}
	'video/x-ms-wvx':                                                                       MimeType{'apache', [
		'wvx',
	], false, ''}
	'video/x-msvideo':                                                                      MimeType{'apache', [
		'avi',
	], false, ''}
	'video/x-sgi-movie':                                                                    MimeType{'apache', [
		'movie',
	], false, ''}
	'video/x-smv':                                                                          MimeType{'apache', [
		'smv',
	], false, ''}
	'x-conference/x-cooltalk':                                                              MimeType{'apache', [
		'ice',
	], false, ''}
	'x-shader/x-fragment':                                                                  MimeType{'', [], true, ''}
	'x-shader/x-vertex':                                                                    MimeType{'', [], true, ''}
}
