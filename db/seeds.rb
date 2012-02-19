u = User.create :first_name => "Peter", :last_name => "Rebernik", :email => "peter@spm.si", :password => "peterr", :password_confirmation => "peterr"
u.admin = true
u.save

u = User.create :first_name => "Ljubomir", :last_name => "Marković", :email => "ljm@spm.si", :password => "ljmljm", :password_confirmation => "ljmljm"
u.admin = true
u.save

u = User.create :first_name => "Miha", :last_name => "Rebernik", :email => "mre@spm.si", :password => "mremre", :password_confirmation => "mremre"
u.admin = true
u.save

PostOffice.create([
  {:post_number => 1000, :city => 'Ljubljana'}, 
  {:post_number => 1210, :city => 'Ljubljana - Šentvid'}, 
  {:post_number => 1211, :city => 'Ljubljana - Šmartno'}, 
  {:post_number => 1215, :city => 'Medvode'}, 
  {:post_number => 1216, :city => 'Smlednik'}, 
  {:post_number => 1217, :city => 'Vodice'}, 
  {:post_number => 1218, :city => 'Komenda'}, 
  {:post_number => 1219, :city => 'Laze v Tuhinju'}, 
  {:post_number => 1221, :city => 'Motnik'}, 
  {:post_number => 1222, :city => 'Trojane'}, 
  {:post_number => 1223, :city => 'Blagovica'}, 
  {:post_number => 1225, :city => 'Lukovica'}, 
  {:post_number => 1230, :city => 'Domžale'}, 
  {:post_number => 1231, :city => 'Ljubljana - Črnuče'}, 
  {:post_number => 1233, :city => 'Dob'}, 
  {:post_number => 1234, :city => 'Mengeš'}, 
  {:post_number => 1235, :city => 'Radomlje'}, 
  {:post_number => 1236, :city => 'Trzin'}, 
  {:post_number => 1241, :city => 'Kamnik'}, 
  {:post_number => 1242, :city => 'Stahovica'}, 
  {:post_number => 1251, :city => 'Moravče'}, 
  {:post_number => 1252, :city => 'Vače'}, 
  {:post_number => 1260, :city => 'Ljubljana - Polje'}, 
  {:post_number => 1261, :city => 'Ljubljana - Dobrunje'}, 
  {:post_number => 1262, :city => 'Dol pri Ljubljani'}, 
  {:post_number => 1270, :city => 'Litija'}, 
  {:post_number => 1272, :city => 'Polšnik'}, 
  {:post_number => 1273, :city => 'Dole pri Litiji'}, 
  {:post_number => 1274, :city => 'Gabrovka'}, 
  {:post_number => 1275, :city => 'Šmartno pri Litiji'}, 
  {:post_number => 1276, :city => 'Primskovo '}, 
  {:post_number => 1281, :city => 'Kresnice'}, 
  {:post_number => 1282, :city => 'Sava'}, 
  {:post_number => 1290, :city => 'Grosuplje'}, 
  {:post_number => 1291, :city => 'Škofljica'}, 
  {:post_number => 1292, :city => 'Ig'}, 
  {:post_number => 1293, :city => 'Šmarje-Sap'}, 
  {:post_number => 1294, :city => 'Višnja Gora'}, 
  {:post_number => 1295, :city => 'Ivančna Gorica'}, 
  {:post_number => 1296, :city => 'Šentvid pri Stični'}, 
  {:post_number => 1301, :city => 'Krka'}, 
  {:post_number => 1303, :city => 'Zagradec'}, 
  {:post_number => 1310, :city => 'Ribnica'}, 
  {:post_number => 1311, :city => 'Turjak'}, 
  {:post_number => 1312, :city => 'Videm-Dobrepolje'}, 
  {:post_number => 1313, :city => 'Struge'}, 
  {:post_number => 1314, :city => 'Rob'}, 
  {:post_number => 1315, :city => 'Velike Lašče'}, 
  {:post_number => 1316, :city => 'Ortnek'}, 
  {:post_number => 1317, :city => 'Sodražica'}, 
  {:post_number => 1318, :city => 'Loški Potok'}, 
  {:post_number => 1319, :city => 'Draga'}, 
  {:post_number => 1330, :city => 'Kočevje'}, 
  {:post_number => 1331, :city => 'Dolenja vas'}, 
  {:post_number => 1332, :city => 'Stara Cerkev'}, 
  {:post_number => 1336, :city => 'Vas'}, 
  {:post_number => 1337, :city => 'Osilnica'}, 
  {:post_number => 1338, :city => 'Kočevska Reka'}, 
  {:post_number => 1351, :city => 'Brezovica pri Ljubljani'}, 
  {:post_number => 1352, :city => 'Preserje'}, 
  {:post_number => 1353, :city => 'Borovnica'}, 
  {:post_number => 1354, :city => 'Horjul'}, 
  {:post_number => 1355, :city => 'Polhov Gradec'}, 
  {:post_number => 1356, :city => 'Dobrova'}, 
  {:post_number => 1357, :city => 'Notranje Gorice'}, 
  {:post_number => 1358, :city => 'Log pri Brezovici'}, 
  {:post_number => 1360, :city => 'Vrhnika'}, 
  {:post_number => 1370, :city => 'Logatec'}, 
  {:post_number => 1371, :city => 'Logatec'}, 
  {:post_number => 1372, :city => 'Hotedršica'}, 
  {:post_number => 1373, :city => 'Rovte'}, 
  {:post_number => 1380, :city => 'Cerknica'}, 
  {:post_number => 1381, :city => 'Rakek'}, 
  {:post_number => 1382, :city => 'Begunje pri Cerknici'}, 
  {:post_number => 1384, :city => 'Grahovo'}, 
  {:post_number => 1385, :city => 'Nova vas'}, 
  {:post_number => 1386, :city => 'Stari trg pri Ložu'}, 
  {:post_number => 1410, :city => 'Zagorje ob Savi'}, 
  {:post_number => 1411, :city => 'Izlake'}, 
  {:post_number => 1412, :city => 'Kisovec'}, 
  {:post_number => 1413, :city => 'Čemšenik'}, 
  {:post_number => 1414, :city => 'Podkum'}, 
  {:post_number => 1420, :city => 'Trbovlje'}, 
  {:post_number => 1423, :city => 'Dobovec'}, 
  {:post_number => 1430, :city => 'Hrastnik'}, 
  {:post_number => 1431, :city => 'Dol pri Hrastniku'}, 
  {:post_number => 1432, :city => 'Zidani Most'}, 
  {:post_number => 1433, :city => 'Radeče'}, 
  {:post_number => 1434, :city => 'Loka pri Zidanem Mostu'}, 
  {:post_number => 2000, :city => 'Maribor'}, 
  {:post_number => 2201, :city => 'Zgornja Kungota'}, 
  {:post_number => 2204, :city => 'Miklavž na Dravskem polju'}, 
  {:post_number => 2205, :city => 'Starše'}, 
  {:post_number => 2206, :city => 'Marjeta na Dravskem polju'}, 
  {:post_number => 2208, :city => 'Pohorje'}, 
  {:post_number => 2211, :city => 'Pesnica pri Mariboru'}, 
  {:post_number => 2212, :city => 'Šentilj v Slovenskih goricah'}, 
  {:post_number => 2213, :city => 'Zgornja Velka'}, 
  {:post_number => 2214, :city => 'Sladki Vrh'}, 
  {:post_number => 2215, :city => 'Ceršak'}, 
  {:post_number => 2221, :city => 'Jarenina'}, 
  {:post_number => 2222, :city => 'Jakobski Dol'}, 
  {:post_number => 2223, :city => 'Jurovski Dol'}, 
  {:post_number => 2229, :city => 'Malečnik'}, 
  {:post_number => 2230, :city => 'Lenart v Slovenskih goricah'}, 
  {:post_number => 2231, :city => 'Pernica'}, 
  {:post_number => 2232, :city => 'Voličina'}, 
  {:post_number => 2233, :city => 'Sv. Ana v Slovenskih goricah'}, 
  {:post_number => 2234, :city => 'Benedikt'}, 
  {:post_number => 2235, :city => 'Sv. Trojica v Slovenskih goricah'}, 
  {:post_number => 2236, :city => 'Cerkvenjak'}, 
  {:post_number => 2241, :city => 'Spodnji Duplek'}, 
  {:post_number => 2242, :city => 'Zgornja Korena'}, 
  {:post_number => 2250, :city => 'Ptuj'}, 
  {:post_number => 2252, :city => 'Dornava'}, 
  {:post_number => 2253, :city => 'Destrnik'}, 
  {:post_number => 2254, :city => 'Trnovska vas'}, 
  {:post_number => 2255, :city => 'Vitomarci'}, 
  {:post_number => 2256, :city => 'Juršinci'}, 
  {:post_number => 2257, :city => 'Polenšak'}, 
  {:post_number => 2258, :city => 'Sveti Tomaž'}, 
  {:post_number => 2259, :city => 'Ivanjkovci'}, 
  {:post_number => 2270, :city => 'Ormož'}, 
  {:post_number => 2272, :city => 'Gorišnica'}, 
  {:post_number => 2273, :city => 'Podgorci'}, 
  {:post_number => 2274, :city => 'Velika Nedelja'}, 
  {:post_number => 2275, :city => 'Miklavž pri Ormožu'}, 
  {:post_number => 2276, :city => 'Kog'}, 
  {:post_number => 2277, :city => 'Središče ob Dravi'}, 
  {:post_number => 2281, :city => 'Markovci'}, 
  {:post_number => 2282, :city => 'Cirkulane'}, 
  {:post_number => 2283, :city => 'Zavrč'}, 
  {:post_number => 2284, :city => 'Videm pri Ptuju'}, 
  {:post_number => 2285, :city => 'Zgornji Leskovec'}, 
  {:post_number => 2286, :city => 'Podlehnik'}, 
  {:post_number => 2287, :city => 'Žetale'}, 
  {:post_number => 2288, :city => 'Hajdina'}, 
  {:post_number => 2289, :city => 'Stoperce'}, 
  {:post_number => 2310, :city => 'Slovenska Bistrica'}, 
  {:post_number => 2311, :city => 'Hoče'}, 
  {:post_number => 2312, :city => 'Orehova vas'}, 
  {:post_number => 2313, :city => 'Fram'}, 
  {:post_number => 2314, :city => 'Zgornja Polskava'}, 
  {:post_number => 2315, :city => 'Šmartno na Pohorju'}, 
  {:post_number => 2316, :city => 'Zgornja Ložnica'}, 
  {:post_number => 2317, :city => 'Oplotnica'}, 
  {:post_number => 2318, :city => 'Laporje'}, 
  {:post_number => 2319, :city => 'Poljčane'}, 
  {:post_number => 2321, :city => 'Makole'}, 
  {:post_number => 2322, :city => 'Majšperk'}, 
  {:post_number => 2323, :city => 'Ptujska Gora'}, 
  {:post_number => 2324, :city => 'Lovrenc na Dravskem polju'}, 
  {:post_number => 2325, :city => 'Kidričevo'}, 
  {:post_number => 2326, :city => 'Cirkovce'}, 
  {:post_number => 2327, :city => 'Rače'}, 
  {:post_number => 2331, :city => 'Pragersko'}, 
  {:post_number => 2341, :city => 'Limbuš'}, 
  {:post_number => 2342, :city => 'Ruše'}, 
  {:post_number => 2343, :city => 'Fala'}, 
  {:post_number => 2344, :city => 'Lovrenc na Pohorju'}, 
  {:post_number => 2345, :city => 'Bistrica ob Dravi'}, 
  {:post_number => 2351, :city => 'Kamnica'}, 
  {:post_number => 2352, :city => 'Selnica ob Dravi'}, 
  {:post_number => 2353, :city => 'Sv. Duh na Ostrem Vrhu'}, 
  {:post_number => 2354, :city => 'Bresternica'}, 
  {:post_number => 2360, :city => 'Radlje ob Dravi'}, 
  {:post_number => 2361, :city => 'Ožbalt'}, 
  {:post_number => 2362, :city => 'Kapla'}, 
  {:post_number => 2363, :city => 'Podvelka'}, 
  {:post_number => 2364, :city => 'Ribnica na Pohorju'}, 
  {:post_number => 2365, :city => 'Vuhred'}, 
  {:post_number => 2366, :city => 'Muta'}, 
  {:post_number => 2367, :city => 'Vuzenica'}, 
  {:post_number => 2370, :city => 'Dravograd'}, 
  {:post_number => 2371, :city => 'Trbonje'}, 
  {:post_number => 2372, :city => 'Libeliče'}, 
  {:post_number => 2373, :city => 'Šentjanž pri Dravogradu'}, 
  {:post_number => 2380, :city => 'Slovenj Gradec'}, 
  {:post_number => 2381, :city => 'Podgorje pri Slovenj Gradcu'}, 
  {:post_number => 2382, :city => 'Mislinja'}, 
  {:post_number => 2383, :city => 'Šmartno pri Slovenj Gradcu'}, 
  {:post_number => 2390, :city => 'Ravne na Koroškem'}, 
  {:post_number => 2391, :city => 'Prevalje'}, 
  {:post_number => 2392, :city => 'Mežica'}, 
  {:post_number => 2393, :city => 'Črna na Koroškem'}, 
  {:post_number => 2394, :city => 'Kotlje'}, 
  {:post_number => 3000, :city => 'Celje'}, 
  {:post_number => 3201, :city => 'Šmartno v Rožni dolini'}, 
  {:post_number => 3202, :city => 'Ljubečna'}, 
  {:post_number => 3203, :city => 'Nova Cerkev'}, 
  {:post_number => 3204, :city => 'Dobrna'}, 
  {:post_number => 3205, :city => 'Vitanje'}, 
  {:post_number => 3206, :city => 'Stranice'}, 
  {:post_number => 3210, :city => 'Slovenske Konjice'}, 
  {:post_number => 3211, :city => 'Škofja vas'}, 
  {:post_number => 3212, :city => 'Vojnik'}, 
  {:post_number => 3213, :city => 'Frankolovo'}, 
  {:post_number => 3214, :city => 'Zreče'}, 
  {:post_number => 3215, :city => 'Loče'}, 
  {:post_number => 3220, :city => 'Štore'}, 
  {:post_number => 3221, :city => 'Teharje'}, 
  {:post_number => 3222, :city => 'Dramlje'}, 
  {:post_number => 3223, :city => 'Loka pri Žusmu'}, 
  {:post_number => 3224, :city => 'Dobje pri Planini'}, 
  {:post_number => 3225, :city => 'Planina pri Sevnici'}, 
  {:post_number => 3230, :city => 'Šentjur'}, 
  {:post_number => 3231, :city => 'Grobelno'}, 
  {:post_number => 3232, :city => 'Ponikva'}, 
  {:post_number => 3233, :city => 'Kalobje'}, 
  {:post_number => 3240, :city => 'Šmarje pri Jelšah'}, 
  {:post_number => 3241, :city => 'Podplat'}, 
  {:post_number => 3250, :city => 'Rogaška Slatina'}, 
  {:post_number => 3252, :city => 'Rogatec'}, 
  {:post_number => 3253, :city => 'Pristava pri Mestinju'}, 
  {:post_number => 3254, :city => 'Podčetrtek'}, 
  {:post_number => 3255, :city => 'Buče'}, 
  {:post_number => 3256, :city => 'Bistrica ob Sotli'}, 
  {:post_number => 3257, :city => 'Podsreda'}, 
  {:post_number => 3260, :city => 'Kozje'}, 
  {:post_number => 3261, :city => 'Lesično'}, 
  {:post_number => 3262, :city => 'Prevorje'}, 
  {:post_number => 3263, :city => 'Gorica pri Slivnici'}, 
  {:post_number => 3264, :city => 'Sveti Štefan'}, 
  {:post_number => 3270, :city => 'Laško'}, 
  {:post_number => 3271, :city => 'Šentrupert'}, 
  {:post_number => 3272, :city => 'Rimske Toplice'}, 
  {:post_number => 3273, :city => 'Jurklošter'}, 
  {:post_number => 3301, :city => 'Petrovče'}, 
  {:post_number => 3302, :city => 'Griže'}, 
  {:post_number => 3303, :city => 'Gomilsko'}, 
  {:post_number => 3304, :city => 'Tabor'}, 
  {:post_number => 3305, :city => 'Vransko'}, 
  {:post_number => 3310, :city => 'Žalec'}, 
  {:post_number => 3311, :city => 'Šempeter v Savinjski dolini'}, 
  {:post_number => 3312, :city => 'Prebold'}, 
  {:post_number => 3313, :city => 'Polzela'}, 
  {:post_number => 3314, :city => 'Braslovče'}, 
  {:post_number => 3320, :city => 'Velenje'}, 
  {:post_number => 3325, :city => 'Šoštanj'}, 
  {:post_number => 3326, :city => 'Topolšica'}, 
  {:post_number => 3327, :city => 'Šmartno ob Paki'}, 
  {:post_number => 3330, :city => 'Mozirje'}, 
  {:post_number => 3331, :city => 'Nazarje'}, 
  {:post_number => 3332, :city => 'Rečica ob Savinji'}, 
  {:post_number => 3333, :city => 'Ljubno ob Savinji'}, 
  {:post_number => 3334, :city => 'Luče'}, 
  {:post_number => 3335, :city => 'Solčava'}, 
  {:post_number => 3341, :city => 'Šmartno ob Dreti'}, 
  {:post_number => 3342, :city => 'Gornji Grad'}, 
  {:post_number => 4000, :city => 'Kranj'}, 
  {:post_number => 4201, :city => 'Zgornja Besnica'}, 
  {:post_number => 4202, :city => 'Naklo'}, 
  {:post_number => 4203, :city => 'Duplje'}, 
  {:post_number => 4204, :city => 'Golnik'}, 
  {:post_number => 4205, :city => 'Preddvor'}, 
  {:post_number => 4206, :city => 'Zgornje Jezersko'}, 
  {:post_number => 4207, :city => 'Cerklje na Gorenjskem'}, 
  {:post_number => 4208, :city => 'Šenčur'}, 
  {:post_number => 4209, :city => 'Žabnica'}, 
  {:post_number => 4210, :city => 'Brnik aerodrom'}, 
  {:post_number => 4211, :city => 'Mavčiče'}, 
  {:post_number => 4212, :city => 'Visoko'}, 
  {:post_number => 4220, :city => 'Škofja Loka'}, 
  {:post_number => 4223, :city => 'Poljane nad Škofjo Loko'}, 
  {:post_number => 4224, :city => 'Gorenja vas'}, 
  {:post_number => 4225, :city => 'Sovodenj'}, 
  {:post_number => 4226, :city => 'Žiri'}, 
  {:post_number => 4227, :city => 'Selca'}, 
  {:post_number => 4228, :city => 'Železniki'}, 
  {:post_number => 4229, :city => 'Sorica'}, 
  {:post_number => 4240, :city => 'Radovljica'}, 
  {:post_number => 4243, :city => 'Brezje'}, 
  {:post_number => 4244, :city => 'Podnart'}, 
  {:post_number => 4245, :city => 'Kropa'}, 
  {:post_number => 4246, :city => 'Kamna Gorica'}, 
  {:post_number => 4247, :city => 'Zgornje Gorje'}, 
  {:post_number => 4248, :city => 'Lesce'}, 
  {:post_number => 4260, :city => 'Bled'}, 
  {:post_number => 4263, :city => 'Bohinjska Bela'}, 
  {:post_number => 4264, :city => 'Bohinjska Bistrica'}, 
  {:post_number => 4265, :city => 'Bohinjsko jezero'}, 
  {:post_number => 4267, :city => 'Srednja vas v Bohinju'}, 
  {:post_number => 4270, :city => 'Jesenice'}, 
  {:post_number => 4273, :city => 'Blejska Dobrava'}, 
  {:post_number => 4274, :city => 'Žirovnica'}, 
  {:post_number => 4275, :city => 'Begunje na Gorenjskem'}, 
  {:post_number => 4276, :city => 'Hrušica'}, 
  {:post_number => 4280, :city => 'Kranjska Gora'}, 
  {:post_number => 4281, :city => 'Mojstrana'}, 
  {:post_number => 4282, :city => 'Gozd Martuljek'}, 
  {:post_number => 4283, :city => 'Rateče-Planica'}, 
  {:post_number => 4290, :city => 'Tržič'}, 
  {:post_number => 4294, :city => 'Križe'}, 
  {:post_number => 5000, :city => 'Nova Gorica'}, 
  {:post_number => 5210, :city => 'Deskle'}, 
  {:post_number => 5211, :city => 'Kojsko'}, 
  {:post_number => 5212, :city => 'Dobrovo v Brdih'}, 
  {:post_number => 5213, :city => 'Kanal'}, 
  {:post_number => 5214, :city => 'Kal nad Kanalom'}, 
  {:post_number => 5215, :city => 'Ročinj'}, 
  {:post_number => 5216, :city => 'Most na Soči'}, 
  {:post_number => 5220, :city => 'Tolmin'}, 
  {:post_number => 5222, :city => 'Kobarid'}, 
  {:post_number => 5223, :city => 'Breginj'}, 
  {:post_number => 5224, :city => 'Srpenica'}, 
  {:post_number => 5230, :city => 'Bovec'}, 
  {:post_number => 5231, :city => 'Log pod Mangartom'}, 
  {:post_number => 5232, :city => 'Soča'}, 
  {:post_number => 5242, :city => 'Grahovo ob Bači'}, 
  {:post_number => 5243, :city => 'Podbrdo'}, 
  {:post_number => 5250, :city => 'Solkan'}, 
  {:post_number => 5251, :city => 'Grgar'}, 
  {:post_number => 5252, :city => 'Trnovo pri Gorici'}, 
  {:post_number => 5253, :city => 'Čepovan'}, 
  {:post_number => 5261, :city => 'Šempas'}, 
  {:post_number => 5262, :city => 'Črniče'}, 
  {:post_number => 5263, :city => 'Dobravlje'}, 
  {:post_number => 5270, :city => 'Ajdovščina'}, 
  {:post_number => 5271, :city => 'Vipava'}, 
  {:post_number => 5272, :city => 'Podnanos'}, 
  {:post_number => 5273, :city => 'Col'}, 
  {:post_number => 5274, :city => 'Črni Vrh nad Idrijo'}, 
  {:post_number => 5275, :city => 'Godovič'}, 
  {:post_number => 5280, :city => 'Idrija'}, 
  {:post_number => 5281, :city => 'Spodnja Idrija'}, 
  {:post_number => 5282, :city => 'Cerkno'}, 
  {:post_number => 5283, :city => 'Slap ob Idrijci'}, 
  {:post_number => 5290, :city => 'Šempeter pri Gorici'}, 
  {:post_number => 5291, :city => 'Miren'}, 
  {:post_number => 5292, :city => 'Renče'}, 
  {:post_number => 5293, :city => 'Volčja Draga'}, 
  {:post_number => 5294, :city => 'Dornberk'}, 
  {:post_number => 5295, :city => 'Branik'}, 
  {:post_number => 5296, :city => 'Kostanjevica na Krasu'}, 
  {:post_number => 5297, :city => 'Prvačina'}, 
  {:post_number => 6000, :city => 'Koper - Capodistria'}, 
  {:post_number => 6210, :city => 'Sežana'}, 
  {:post_number => 6215, :city => 'Divača'}, 
  {:post_number => 6216, :city => 'Podgorje'}, 
  {:post_number => 6217, :city => 'Vremski Britof'}, 
  {:post_number => 6219, :city => 'Lokev'}, 
  {:post_number => 6221, :city => 'Dutovlje'}, 
  {:post_number => 6222, :city => 'Štanjel'}, 
  {:post_number => 6223, :city => 'Komen'}, 
  {:post_number => 6224, :city => 'Senožeče'}, 
  {:post_number => 6225, :city => 'Hruševje'}, 
  {:post_number => 6230, :city => 'Postojna'}, 
  {:post_number => 6232, :city => 'Planina'}, 
  {:post_number => 6240, :city => 'Kozina'}, 
  {:post_number => 6242, :city => 'Materija'}, 
  {:post_number => 6243, :city => 'Obrov'}, 
  {:post_number => 6244, :city => 'Podgrad'}, 
  {:post_number => 6250, :city => 'Ilirska Bistrica'}, 
  {:post_number => 6251, :city => 'Ilirska Bistrica-Trnovo'}, 
  {:post_number => 6253, :city => 'Knežak'}, 
  {:post_number => 6254, :city => 'Jelšane'}, 
  {:post_number => 6255, :city => 'Prem'}, 
  {:post_number => 6256, :city => 'Košana'}, 
  {:post_number => 6257, :city => 'Pivka'}, 
  {:post_number => 6258, :city => 'Prestranek'}, 
  {:post_number => 6271, :city => 'Dekani'}, 
  {:post_number => 6272, :city => 'Gračišče'}, 
  {:post_number => 6273, :city => 'Marezige'}, 
  {:post_number => 6274, :city => 'Šmarje'}, 
  {:post_number => 6275, :city => 'Črni Kal'}, 
  {:post_number => 6276, :city => 'Pobegi'}, 
  {:post_number => 6280, :city => 'Ankaran - Ancarano'}, 
  {:post_number => 6281, :city => 'Škofije'}, 
  {:post_number => 6310, :city => 'Izola - Isola'}, 
  {:post_number => 6320, :city => 'Portorož - Portorose'}, 
  {:post_number => 6323, :city => 'Strunjan - Strugnano (sezonska pošta)'}, 
  {:post_number => 6330, :city => 'Piran - Pirano'}, 
  {:post_number => 6333, :city => 'Sečovlje - Sicciole'}, 
  {:post_number => 8000, :city => 'Novo mesto'}, 
  {:post_number => 8210, :city => 'Trebnje'}, 
  {:post_number => 8211, :city => 'Dobrnič'}, 
  {:post_number => 8212, :city => 'Velika Loka'}, 
  {:post_number => 8213, :city => 'Veliki Gaber'}, 
  {:post_number => 8216, :city => 'Mirna Peč'}, 
  {:post_number => 8220, :city => 'Šmarješke Toplice'}, 
  {:post_number => 8222, :city => 'Otočec'}, 
  {:post_number => 8230, :city => 'Mokronog'}, 
  {:post_number => 8231, :city => 'Trebelno '}, 
  {:post_number => 8232, :city => 'Šentrupert'}, 
  {:post_number => 8233, :city => 'Mirna'}, 
  {:post_number => 8250, :city => 'Brežice'}, 
  {:post_number => 8251, :city => 'Čatež ob Savi'}, 
  {:post_number => 8253, :city => 'Artiče'}, 
  {:post_number => 8254, :city => 'Globoko'}, 
  {:post_number => 8255, :city => 'Pišece'}, 
  {:post_number => 8256, :city => 'Sromlje '}, 
  {:post_number => 8257, :city => 'Dobova'}, 
  {:post_number => 8258, :city => 'Kapele'}, 
  {:post_number => 8259, :city => 'Bizeljsko'}, 
  {:post_number => 8261, :city => 'Jesenice na Dolenjskem'}, 
  {:post_number => 8262, :city => 'Krška vas'}, 
  {:post_number => 8263, :city => 'Cerklje ob Krki'}, 
  {:post_number => 8270, :city => 'Krško'}, 
  {:post_number => 8272, :city => 'Zdole '}, 
  {:post_number => 8273, :city => 'Leskovec pri Krškem'}, 
  {:post_number => 8274, :city => 'Raka'}, 
  {:post_number => 8275, :city => 'Škocjan'}, 
  {:post_number => 8276, :city => 'Bučka '}, 
  {:post_number => 8280, :city => 'Brestanica'}, 
  {:post_number => 8281, :city => 'Senovo'}, 
  {:post_number => 8282, :city => 'Koprivnica'}, 
  {:post_number => 8283, :city => 'Blanca'}, 
  {:post_number => 8290, :city => 'Sevnica'}, 
  {:post_number => 8292, :city => 'Zabukovje '}, 
  {:post_number => 8293, :city => 'Studenec'}, 
  {:post_number => 8294, :city => 'Boštanj'}, 
  {:post_number => 8295, :city => 'Tržišče'}, 
  {:post_number => 8296, :city => 'Krmelj'}, 
  {:post_number => 8297, :city => 'Šentjanž'}, 
  {:post_number => 8310, :city => 'Šentjernej'}, 
  {:post_number => 8311, :city => 'Kostanjevica na Krki'}, 
  {:post_number => 8312, :city => 'Podbočje'}, 
  {:post_number => 8321, :city => 'Brusnice'}, 
  {:post_number => 8322, :city => 'Stopiče'}, 
  {:post_number => 8323, :city => 'Uršna sela'}, 
  {:post_number => 8330, :city => 'Metlika'}, 
  {:post_number => 8331, :city => 'Suhor'}, 
  {:post_number => 8332, :city => 'Gradac'}, 
  {:post_number => 8333, :city => 'Semič'}, 
  {:post_number => 8340, :city => 'Črnomelj'}, 
  {:post_number => 8341, :city => 'Adlešiči'}, 
  {:post_number => 8342, :city => 'Stari trg ob Kolpi'}, 
  {:post_number => 8343, :city => 'Dragatuš'}, 
  {:post_number => 8344, :city => 'Vinica'}, 
  {:post_number => 8350, :city => 'Dolenjske Toplice'}, 
  {:post_number => 8351, :city => 'Straža'}, 
  {:post_number => 8360, :city => 'Žužemberk'}, 
  {:post_number => 8361, :city => 'Dvor'}, 
  {:post_number => 8362, :city => 'Hinje'}, 
  {:post_number => 9000, :city => 'Murska Sobota'}, 
  {:post_number => 9201, :city => 'Puconci'}, 
  {:post_number => 9202, :city => 'Mačkovci'}, 
  {:post_number => 9203, :city => 'Petrovci'}, 
  {:post_number => 9204, :city => 'Šalovci'}, 
  {:post_number => 9205, :city => 'Hodoš - Hodos'}, 
  {:post_number => 9206, :city => 'Križevci'}, 
  {:post_number => 9207, :city => 'Prosenjakovci - Partosfalva'}, 
  {:post_number => 9208, :city => 'Fokovci'}, 
  {:post_number => 9220, :city => 'Lendava - Lendva'}, 
  {:post_number => 9221, :city => 'Martjanci'}, 
  {:post_number => 9222, :city => 'Bogojina'}, 
  {:post_number => 9223, :city => 'Dobrovnik - Dobronak '}, 
  {:post_number => 9224, :city => 'Turnišče'}, 
  {:post_number => 9225, :city => 'Velika Polana'}, 
  {:post_number => 9226, :city => 'Moravske Toplice'}, 
  {:post_number => 9227, :city => 'Kobilje'}, 
  {:post_number => 9231, :city => 'Beltinci'}, 
  {:post_number => 9232, :city => 'Črenšovci'}, 
  {:post_number => 9233, :city => 'Odranci'}, 
  {:post_number => 9240, :city => 'Ljutomer'}, 
  {:post_number => 9241, :city => 'Veržej'}, 
  {:post_number => 9242, :city => 'Križevci pri Ljutomeru'}, 
  {:post_number => 9243, :city => 'Mala Nedelja'}, 
  {:post_number => 9244, :city => 'Sv. Jurij ob Ščavnici'}, 
  {:post_number => 9245, :city => 'Spodnji Ivanjci'}, 
  {:post_number => 9250, :city => 'Gornja Radgona'}, 
  {:post_number => 9251, :city => 'Tišina'}, 
  {:post_number => 9252, :city => 'Radenci'}, 
  {:post_number => 9253, :city => 'Apače'}, 
  {:post_number => 9261, :city => 'Cankova'}, 
  {:post_number => 9262, :city => 'Rogašovci'}, 
  {:post_number => 9263, :city => 'Kuzma'}, 
  {:post_number => 9264, :city => 'Grad'}, 
  {:post_number => 9265, :city => 'Bodonci'}
])
