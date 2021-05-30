#!/bin/sh
# This is free and unencumbered software released into the public domain.
#  For more information, please refer to <https://unlicense.org>

MWD=$(pwd)
TESTDIR="$HOME/.cache/unace1tests"
#remove_test_dir=1 # comment out
mkdir -p "${TESTDIR}"

app="$(pwd)/unace"

if ! test -f configure ; then
	if test -f autogen.sh ; then
		./autogen.sh
	fi
fi

if test -f configure ; then
	if ! test -f config.h ; then
		./configure ${configure_opts}
	fi
fi

if test -f Makefile ; then
	${make_clean}
	make CFLAGS="-D${appbn}_TRACE -ggdb3"
fi

if ! test -f ${app} ; then
	echo "$app not found"
	exit 1
fi

# ===========================================================================

cd ${TESTDIR}

ret=0

echo
printf "* tests/dirtraversal1.ace: "
${app} x -y ${MWD}/tests/dirtraversal1.ace >${TESTDIR}/dirtraversal1.log 2>&1
if [ $? -eq 7 ] ; then
	echo "OK"
else
	ret=1
	echo "ERROR"
fi

printf "* tests/dirtraversal2.ace: "
${app} x -y ${MWD}/tests/dirtraversal2.ace >${TESTDIR}/dirtraversal2.log 2>&1
if [ $? -eq 7 ] ; then
	echo "OK"
else
	ret=1
	echo "ERROR"
fi

printf "* tests/onefile.ace: "
rm -f CHANGES.LOG
${app} x -y ${MWD}/tests/onefile.ace >${TESTDIR}/onefile.log 2>&1
echo -n 'ba6fdcc7376a3d91074b2b798142546c  CHANGES.LOG' > onefile.md5
if md5sum -c onefile.md5 >${TESTDIR}/onefile.log 2>&1 ; then
	echo "OK"
else
	ret=1
	echo "ERROR"
fi

printf "* tests/ZGFX2.ace: "
rm -rf ZGFX2
${app} x -y ${MWD}/tests/ZGFX2.ace >${TESTDIR}/ZGFX2.log 2>&1
if [ $? -eq 0 ] && [ $(find ZGFX2 -type f | wc -l) -eq 223 ] ; then
	echo '00e5b3a770b9183c1146f29ab8ce66d4  ZGFX2/extra/back.DSL
433bb944f968962a6ee50ea9f47413a7  ZGFX2/extra/CLUBSCRN.DSL
f0ed7e999e8bb916fcba8d33dc0cea19  ZGFX2/extra/clubstil.DSL
333045a051a11e955f41dde347f2531a  ZGFX2/extra/corslogo.DSL
3581b40b81968cf7b37b22ff59366f7d  ZGFX2/extra/default.pal
16b0bf7bdddcee3523fb62b4d1e0d28b  ZGFX2/extra/DEMOINFO.DSL
ffa5d28c10f22eb3e7607915e3073337  ZGFX2/extra/font4.DSL
cde89146d5a1189d81241f5c7f333ef6  ZGFX2/extra/font4.FNT
c501ba53f3ebed544af056a0bfbb5d9f  ZGFX2/extra/font5.DSL
5a90d9cc4ad57b4ea8f889a01dfd7906  ZGFX2/extra/font5.FNT
e95b196a877c9be37167df80919cd970  ZGFX2/extra/font6.DSL
cde89146d5a1189d81241f5c7f333ef6  ZGFX2/extra/font6.FNT
2ff0a086cae8cffb46179ca52445dd44  ZGFX2/extra/font7.DSL
5a90d9cc4ad57b4ea8f889a01dfd7906  ZGFX2/extra/font7.FNT
b7523df85668228df90458d9176e49a6  ZGFX2/extra/font8.DSL
cde89146d5a1189d81241f5c7f333ef6  ZGFX2/extra/font8.FNT
a3750845fafea4db2e9bfbcbda0a38ff  ZGFX2/extra/font9.DSL
adc882926593c308de6bfcaefca4ef07  ZGFX2/extra/sub/font10.DSL
cde89146d5a1189d81241f5c7f333ef6  ZGFX2/extra/sub/font10.FNT
dd0150b89f77fc5c71ec6f3c0c485482  ZGFX2/extra/sub/font11.DSL
5a90d9cc4ad57b4ea8f889a01dfd7906  ZGFX2/extra/sub/font11.FNT
5a90d9cc4ad57b4ea8f889a01dfd7906  ZGFX2/extra/sub/font9.FNT
74e253f131cd9f5595397bf54bc64e00  ZGFX2/extra/sub/FontSW.DSL
04bb38f06b92ae4da9961e8cd8dae9d3  ZGFX2/extra/sub/FontSW.FNT
928ef6c96c29e5964437db90cf4788c5  ZGFX2/extra/sub/FOXLEG.DSL
71179157175ceaba98b10341317ce4fb  ZGFX2/extra/sub/frontend.pal
310482dd4df5d6112a0f1b35c35aa27f  ZGFX2/extra/sub/GOLFRSET.DSL
406d78a6ba9699b49c0dd3859f6f6a0a  ZGFX2/extra/sub/Ground.pal
3bd3ab6ddb9d4688ca15bc2e80a8dfa9  ZGFX2/extra/sub/InGame.pal
f6304b2864604f1a0ae221c9f6ac2cb8  ZGFX2/extra/sub/legalP.DSL
d93e876021534b6eb51e69b0f0b58cc4  ZGFX2/InGame/FontIR.DSL
4ea7236ea118217955e6d8b2716a4d6c  ZGFX2/InGame/FontIR.FNT
962d48a1cbe6f692e6dc614db82784b7  ZGFX2/InGame/FontIW.DSL
4ea7236ea118217955e6d8b2716a4d6c  ZGFX2/InGame/FontIW.FNT
35b712c591a57537a5bf1617cc6789c9  ZGFX2/InGame/FontLC.FNT
35b712c591a57537a5bf1617cc6789c9  ZGFX2/InGame/FontLR.FNT
a8259dd6ba648b10e7f6164e61973702  ZGFX2/InGame/FontLW.DSL
35b712c591a57537a5bf1617cc6789c9  ZGFX2/InGame/FontLW.FNT
35b712c591a57537a5bf1617cc6789c9  ZGFX2/InGame/FontLY.FNT
d006f025139cd7b4e7fb263d5030ba3a  ZGFX2/InGame/FontOW.DSL
6fde890038e41e07822ce88cde2229b8  ZGFX2/InGame/FontSC.DSL
cecd1364c883bb067386e4238ece7a13  ZGFX2/InGame/FontSC.FNT
7d6f529eee75c00029ef73732e4def08  ZGFX2/InGame/FontSR.DSL
cecd1364c883bb067386e4238ece7a13  ZGFX2/InGame/FontSR.FNT
962d48a1cbe6f692e6dc614db82784b7  ZGFX2/InGame/FontSW.DSL
cecd1364c883bb067386e4238ece7a13  ZGFX2/InGame/FontSW.FNT
d93e876021534b6eb51e69b0f0b58cc4  ZGFX2/InGame/FontSY.DSL
cecd1364c883bb067386e4238ece7a13  ZGFX2/InGame/FontSY.FNT
0d6e006ffae082158a6e3d7f8b19b38f  ZGFX2/InGame/HiFontIR.DSL
4681bf2837ba90f7c173f703122274d3  ZGFX2/InGame/HiFontIR.FNT
d46b870271778517803624e0be93a2d5  ZGFX2/InGame/HiFontIW.DSL
4681bf2837ba90f7c173f703122274d3  ZGFX2/InGame/HiFontIW.FNT
5d20b7f2471dbf3ee43087b5414250fc  ZGFX2/InGame/HiFontLC.FNT
5d20b7f2471dbf3ee43087b5414250fc  ZGFX2/InGame/HiFontLR.FNT
c3e43ba20949317d39a63909e017de1f  ZGFX2/InGame/HiFontLW.DSL
5d20b7f2471dbf3ee43087b5414250fc  ZGFX2/InGame/HiFontLW.FNT
5d20b7f2471dbf3ee43087b5414250fc  ZGFX2/InGame/HiFontLY.FNT
fe0b0f0bb8d305160c8eb71814f945e8  ZGFX2/InGame/HiFontSC.FNT
3ee554f2bd9c79ed6624c840fddc53e9  ZGFX2/InGame/HiFontSR.DSL
fe0b0f0bb8d305160c8eb71814f945e8  ZGFX2/InGame/HiFontSR.FNT
d46b870271778517803624e0be93a2d5  ZGFX2/InGame/HiFontSW.DSL
fe0b0f0bb8d305160c8eb71814f945e8  ZGFX2/InGame/HiFontSW.FNT
0d6e006ffae082158a6e3d7f8b19b38f  ZGFX2/InGame/HiFontSY.DSL
fe0b0f0bb8d305160c8eb71814f945e8  ZGFX2/InGame/HiFontSY.FNT
5e0018a15492487c454dd7a166c3ef01  ZGFX2/InGame/InGame.DSL
b16693624ac1dd39c25abf356aafdeff  ZGFX2/Loading.DSL
ac863975026ab91e09e3bea665f23f99  ZGFX2/Map/mp0001.DSL
e874b5dade682d254cc2bc1b581e0eb9  ZGFX2/Map/mp0002.DSL
7aefa20d729f12ba47fcd063dcf0bb60  ZGFX2/Map/mp0101.DSL
1081c454444e89766580426d01818745  ZGFX2/Map/mp0102.DSL
b468e152010741bcb36395ea5795cbac  ZGFX2/Map/mp0103.DSL
ce2a1ba8226e52d41170df620616caa5  ZGFX2/Map/mp0104.DSL
d5949395ef8cb32c4ecf05583293b063  ZGFX2/Map/mp0105.DSL
1bc88a21695873f7ce8369d919343243  ZGFX2/Map/mp0106.DSL
01166d5fa30b655dd232f84b97b5f90f  ZGFX2/Map/mp0107.DSL
4ddb0aa4f265aa62b648e58473bca11a  ZGFX2/Map/mp0108.DSL
7e0049f2079d71747bc8316f73cd158d  ZGFX2/Map/mp0109.DSL
c4500dbf670bb6f3226b0c82671ecc5d  ZGFX2/Map/mp0110.DSL
8f0c67a8e17c7ed302f6bbda674a3377  ZGFX2/Map/mp0111.DSL
cff8cd16757595ca30d9ec0e68ee3f95  ZGFX2/Map/mp0112.DSL
40542b0261bb659b6f1845f3c9aa6364  ZGFX2/Map/mp0113.DSL
b21cf528733a68454fb3a0d98f18463b  ZGFX2/Map/mp0114.DSL
7907a4670d9a025588db9351fe913053  ZGFX2/Map/mp0115.DSL
4789454fd88c92c82687d19348db36e6  ZGFX2/Map/mp0116.DSL
e20e11d592db5e061cb0cf65c3c99134  ZGFX2/Map/mp0117.DSL
b3d299c8c38738030373e99e14053682  ZGFX2/Map/mp0118.DSL
2c2db5ea04a26daa578f0bd468496cff  ZGFX2/Map/mp0201.DSL
3eae39acdc0337a49a622da8dde4a230  ZGFX2/Map/mp0202.DSL
441764a217e276886e884bba01e5467f  ZGFX2/Map/mp0203.DSL
705abae7c84fffd6d4e81be04e0c05c9  ZGFX2/Map/mp0204.DSL
d2d552febeb7ac047d89207d9f74da7b  ZGFX2/Map/mp0205.DSL
0f723b3e4d1d82dae7e9d66a991d4bde  ZGFX2/Map/mp0206.DSL
ef77823d2afbba3a80c13c3b650244d0  ZGFX2/Map/mp0207.DSL
ec9139e5cbb0c79a7dccf08e8b020a80  ZGFX2/Map/mp0208.DSL
6b6e7382dd86a137130fb9c140bf9983  ZGFX2/Map/mp0209.DSL
e15ed9a05411c05ae6078c1084ee2a00  ZGFX2/Map/mp0210.DSL
728b6bdf217d152cdf879ab6fc6b2603  ZGFX2/Map/mp0211.DSL
17029dec9dfd8db10045dae68d44052b  ZGFX2/Map/mp0212.DSL
0457b426308f43451e49e9d7a8258efd  ZGFX2/Map/mp0213.DSL
2efef1bc7ebe7a641244549ebcd84584  ZGFX2/Map/mp0214.DSL
425709e92b39ee307cc457faff8e4d05  ZGFX2/Map/mp0215.DSL
76ce8877ef657f44287c5fe8afacd8e7  ZGFX2/Map/mp0216.DSL
1e0107e26b3708fd5db0a6f40060680a  ZGFX2/Map/mp0217.DSL
c17469156fb3a84b79eff1c9a706e4f0  ZGFX2/Map/mp0218.DSL
0dc427f0cdea4fa2db41a5e1322e3d09  ZGFX2/Map/mp0301.DSL
637546236bef2cb814cd30b72b7244d5  ZGFX2/Map/mp0302.DSL
a56a846e8752851bd13d20bd33156814  ZGFX2/Map/mp0303.DSL
284cc73c44ab76d3881fd577fb9e89ab  ZGFX2/Map/mp0304.DSL
3efa72271c9f6fc18b643b01e8efb229  ZGFX2/Map/mp0305.DSL
1969f593d58d721373556604ffb232ea  ZGFX2/Map/mp0306.DSL
1e51c53f52b3638fd88e60edbaaf4dda  ZGFX2/Map/mp0307.DSL
e77ac591a907c818bef360fa48c78af9  ZGFX2/Map/mp0308.DSL
53adbd52e1d1d8b6dd2609ec62b1f414  ZGFX2/Map/mp0309.DSL
f002d12e8e42a77f73e1b2867cf4af16  ZGFX2/Map/mp0310.DSL
9521bae73ad27a9a145d2972588aee83  ZGFX2/Map/mp0311.DSL
31cd7500c0979076f272b55e00aae432  ZGFX2/Map/mp0312.DSL
c718b211e3d64a001a0c138a843b4b09  ZGFX2/Map/mp0313.DSL
dbbdfcc04209fdbb0d489ec0091f6d9a  ZGFX2/Map/mp0314.DSL
22f10c17ebfb3f5b063e3c3dfa11e0d5  ZGFX2/Map/mp0315.DSL
1e8bf160282d0ca37885809fb1cf1f37  ZGFX2/Map/mp0316.DSL
ef07c62689e096040e47a8f1b21736f5  ZGFX2/Map/mp0317.DSL
4337fc97b0d7ea534131973c371178a9  ZGFX2/Map/mp0318.DSL
73a24b7e6cb6c0b3fb2d1cf9d32fbb44  ZGFX2/Map/mp0401.DSL
b4fc11cd3696cc897e4f3cc07cd2a86c  ZGFX2/Map/mp0402.DSL
11b59d408b2cc78a5c9a4572a9cbe243  ZGFX2/Map/mp0403.DSL
e3dcc8340015ce142883826a86ad5767  ZGFX2/Map/mp0404.DSL
cd42b4357690f8c9c0c62b9d28c472f7  ZGFX2/Map/mp0405.DSL
c32e2388c69bbb93ae77ad3a5297ab9d  ZGFX2/Map/mp0406.DSL
a209ab73109249beb3292acb816a3331  ZGFX2/Map/mp0407.DSL
c2234013229f54d847896f8eccd80f5b  ZGFX2/Map/mp0408.DSL
a5df4072eb2c5d0231f1156f11f1813a  ZGFX2/Map/mp0409.DSL
57ecbceeff9be722338929b743a45370  ZGFX2/Map/mp0410.DSL
143ccd756f6000026fb3b96a58d7a228  ZGFX2/Map/mp0411.DSL
c5e4a1d61b8c84c5d132996600b87958  ZGFX2/Map/mp0412.DSL
4144536e66a1382e5ffb82590d678e23  ZGFX2/Map/mp0413.DSL
799a9db744e01ed2161697e9de7aff56  ZGFX2/Map/mp0414.DSL
04c0a5f4264b190d5f95f7c615e27a55  ZGFX2/Map/mp0415.DSL
6de88b38dd007e1cbeeca51cfb80fcb8  ZGFX2/Map/mp0416.DSL
fc1bc18fc284075a82a4f8c6284bdd64  ZGFX2/Map/mp0417.DSL
543cbc289bc737c106e8b246428a1394  ZGFX2/Map/mp0418.DSL
b7d2f2714bcc0e26379659b57f8e69f9  ZGFX2/Map/mp0501.DSL
c1e193030afcd3aa8aec72fbdb946cea  ZGFX2/Map/mp0502.DSL
fc4920f02eadc5ff220af7ee74cdabea  ZGFX2/Map/mp0503.DSL
950e58c6145923dd7aab0fd49e241e1a  ZGFX2/Map/mp0504.DSL
65ca307e7f469ea9d64c897764a6061a  ZGFX2/Map/mp0505.DSL
bd6ee1e08c91e578a0768b8cd8c6e9f7  ZGFX2/Map/mp0506.DSL
d87aace7aa8134577e119fc674c8ab68  ZGFX2/Map/mp0507.DSL
d74d39ceb2f333355b64fed1509259bc  ZGFX2/Map/mp0508.DSL
653d469c090632a669d6a01aa8143a24  ZGFX2/Map/mp0509.DSL
99a20bb05919c26021fd3636df23ddb4  ZGFX2/Map/mp0510.DSL
da3c432143316d3df438c7e617b9724d  ZGFX2/Map/mp0511.DSL
988050e662076b1c4a397d30943688f5  ZGFX2/Map/mp0512.DSL
f34380428dbd17b3192c3209acf84f71  ZGFX2/Map/mp0513.DSL
7d84ee373c10bdcdb36e427bfd647b4a  ZGFX2/Map/mp0514.DSL
3b62fac04f8455ec670e37956cb3fc22  ZGFX2/Map/mp0515.DSL
2d9a6762ac56e1a112e0b3bd3a3ec107  ZGFX2/Map/mp0516.DSL
acdbc3cdc5b5a382d5bf49a0341a1eed  ZGFX2/Map/mp0517.DSL
77d360f614f2b53449a203ac98469b1f  ZGFX2/Map/mp0518.DSL
89d7ceef8decf578d312cc73e2db24dc  ZGFX2/Map/mp0601.DSL
d90414e3f56028c27b18766a21537ee2  ZGFX2/Map/mp0602.DSL
f23e28c7455018d03dcb7f2f0af6a018  ZGFX2/Map/mp0603.DSL
a814c4b31c3bea4e7103e2ab873f0802  ZGFX2/Map/mp0604.DSL
9b660aca5f29f453cbde9dca765e2c2f  ZGFX2/Map/mp0605.DSL
10881f975b6844376554e4ea029a1730  ZGFX2/Map/mp0606.DSL
5f5687276e2d4f9e0062dfabefb561b5  ZGFX2/Map/mp0607.DSL
897dab60e2b7dd36ea828fc4c6e1e91d  ZGFX2/Map/mp0608.DSL
08f574b34be36ea21f12e4b24bd0a208  ZGFX2/Map/mp0609.DSL
a54f7cd19f62b5968b3e3cdd06992cec  ZGFX2/Map/mp0610.DSL
e133345239df08b2f5937d6c4a7c810a  ZGFX2/Map/mp0611.DSL
5bad1b2c8bfe2a3f0f7333e84087a766  ZGFX2/Map/mp0612.DSL
075c9a19ef5644db2ba51ce9317f8d46  ZGFX2/Map/mp0613.DSL
2a84cdf2d60f2c826e009edd37126e0e  ZGFX2/Map/mp0614.DSL
aecc98f39a3d548e8be35059b6a0a7af  ZGFX2/Map/mp0615.DSL
f9056ceee9f55adf0f5ac0aacfb149c6  ZGFX2/Map/mp0616.DSL
0cf3f71dc990695f6bb423a577a66724  ZGFX2/Map/mp0617.DSL
a00368594c77835a00bebb8d6e8c93db  ZGFX2/Map/mp0618.DSL
e4b6d3a52020058d1fdc95ceebc3eced  ZGFX2/Map/mp0701.DSL
78380dbc2674ba646eee0c7d1a72a348  ZGFX2/Map/mp0702.DSL
f854a1b5a84d745bca2d7b4109371970  ZGFX2/Map/mp0703.DSL
21e88b6b36277f989b13e5641cd737e2  ZGFX2/Map/mp0704.DSL
933936d1f81786094b962d435bdbfd90  ZGFX2/Map/mp0705.DSL
027ebd80d436c4fe526207266f639556  ZGFX2/Map/mp0706.DSL
ba4de2b06d4e0836122393f71f8ccd43  ZGFX2/Map/mp0707.DSL
d5c620d7e2db025de1635041951cbb08  ZGFX2/Map/mp0708.DSL
175800a5822a0ec547f52fea43a75ffc  ZGFX2/Map/mp0709.DSL
a2aec42673faf9cd4724eb0d3d546ff1  ZGFX2/Map/mp0710.DSL
2b85134c54e1acf90f6eb82eca4cfa7d  ZGFX2/Map/mp0711.DSL
025fd86a7b8f1f601c301596a3ee0f0a  ZGFX2/Map/mp0712.DSL
af933b9c0fcb6cd4ec79f1710b520919  ZGFX2/Map/mp0713.DSL
95dadc6e411176d93e15c49e04c96922  ZGFX2/Map/mp0714.DSL
741357e75d837903d08a04165b59ded0  ZGFX2/Map/mp0715.DSL
6b79e01ac65db0a9869c3e7932acf726  ZGFX2/Map/mp0716.DSL
4a89839262ae8e97569e341dfe5bb991  ZGFX2/Map/mp0717.DSL
3ce32725a53a2a13f368b039dd635ac7  ZGFX2/Map/mp0718.DSL
fe5459180917a1b46113eb6415995ff4  ZGFX2/Map/mp0801.DSL
bdfdca1116eb8bfffa23dad3674b714d  ZGFX2/Map/mp0802.DSL
2b51ebd387b59773af5655282a7c0887  ZGFX2/Map/mp0803.DSL
7c5429fdde173e474a729fee023bea75  ZGFX2/Map/mp0804.DSL
f54163478ee6c4d4931508a93124c073  ZGFX2/Map/mp0805.DSL
8ef1dda668a77e4cdc5931a0f2c508e1  ZGFX2/Map/mp0806.DSL
19a474c58e44927b1bc09ab25ed0278a  ZGFX2/Map/mp0807.DSL
ed7450abf3c3ac0c0b8211dcf6f8ac77  ZGFX2/Map/mp0808.DSL
3ab1135df32b1c84b1c6e39e82b08dec  ZGFX2/Map/mp0809.DSL
48878f25055e96bbe42938ddde63ffc8  ZGFX2/Map/mp0810.DSL
dce9ba5f1c8be70df6eaabe91e7956a3  ZGFX2/Map/mp0811.DSL
afb365434bd92e72b4eb0c2afc349d9f  ZGFX2/Map/mp0812.DSL
62ca08a33bc5f90677743636d7e64fbf  ZGFX2/Map/mp0813.DSL
f04ec735919dbad2f2ae4f5e9a076a60  ZGFX2/Map/mp0814.DSL
88179790e653ab19fb63cc8b47bb93b9  ZGFX2/Map/mp0815.DSL
f8636f17f02fbc5e2cf9a64ffffad059  ZGFX2/Map/mp0816.DSL
fcc3e80fdacb6287c92fa41dcb999997  ZGFX2/Map/mp0817.DSL
4e0448108e86fac2775bc7508a64a114  ZGFX2/Map/mp0818.DSL
83c5839b110008eb23537cb3296104ba  ZGFX2/mficons.DSL
02c85be553e97c37b609b38ab3ab80b9  ZGFX2/mouse.DSL
c5edda161107a214ec541ff93d218ceb  ZGFX2/multisel.DSL
d6d739cc681bf1a0385fbd9605d07a42  ZGFX2/namesel.DSL
a954a08f7bf4af19bb6e01eab5022c15  ZGFX2/opticon.DSL
4a84b7f1de9b1f8bc4b589e5b92a1d8a  ZGFX2/playrnum.DSL
80e5fa502e4d4d2f974b50220b92a973  ZGFX2/PVR.DSL
864726a9140c7c4cdb8fac904e268d94  ZGFX2/RECSCRN.DSL
460e75a9239092e04b096021235cf3e5  ZGFX2/SAVELOAD.DSL
19fab86e8a81dec0791eeb92c3babde5  ZGFX2/SHAMPLUG.DSL
02493f07c207dd932ff8d820e628919b  ZGFX2/stats.DSL' >  ZGFX2.md5
	if md5sum -c ZGFX2.md5 >${TESTDIR}/ZGFX2.log 2>&1 ; then
		echo "OK"
	else
		ret=1
		echo "ERROR"
	fi
else
	ret=1
	echo "ERROR"
fi

printf "* tests/zman.ace: "
rm -rf zman
${app} x -y ${MWD}/tests/zman.ace >${TESTDIR}/zman.log 2>&1
if [ $? -eq 0 ] && [ $(find zman -type f | wc -l) -eq 20 ] ; then
	echo 'fa06435c78402a3427c411e4708a608b  zman/man1/chattr.1
732f0f74a82acc2b494b296cdc11d453  zman/man1/gftp.1
f75b539e814395b92fcd4970ad6fe46d  zman/man1/gmrun.1
a8a76fe1fbd214cc558f6b7d8c88de6d  zman/man1/gwhere.1
9442d68c9d6187d25e8499ba31e26e26  zman/man1/lsattr.1
130c0038746608f1e754b5b0f0b44e23  zman/man1/unshield.1
d41d8cd98f00b204e9800998ecf8427e  zman/man1/xx/emptyfile
967db70db927b87f5ea8e414d425fcfe  zman/man1/xx/mmmmmm/fsckme.flg
0e7272adbb75f58189ebf13e05afd8ba  zman/man6/gtkballs.6x
4bd7a435f9eb083b8b72502f045779bd  zman/man8/aumvdown.8
f7e1045557db5ac3da7922ca09a99ad1  zman/man8/dumpe2fs.8
5924ca4e725801b87576c140cc0a0852  zman/man8/e2freefrag.8
0bb5d4f8f263cc6d46cb66e234babd02  zman/man8/e2label.8
407b92e869c1d67ef92c98a6f5350819  zman/man8/e2mmpstatus.8
8c324b10aa7e4cf5e505af8ebafe4a7f  zman/man8/e2undo.8
d3f33381af4d94e2a38b56ec3a40f3ce  zman/man8/e4crypt.8
8be99b2ce4beb84c60db63a1c089d5ff  zman/man8/e4defrag.8
981b220b93c0d8c4fca31caf2368f841  zman/man8/filefrag.8
fc7df7b0a2410664588aa69096d69fb2  zman/man8/logsave.8
7cb90244a7504ac9de394d2c552014ca  zman/man8/resize2fs.8' >  zman.md5
	if md5sum -c zman.md5 >${TESTDIR}/zman.log 2>&1 ; then
		echo "OK"
	else
		ret=1
		echo "ERROR"
	fi
else
	ret=1
	echo "ERROR"
fi

# ===========================================================================

if test -n "$remove_test_dir" ; then
	rm -rf ${TESTDIR}
fi

exit $ret