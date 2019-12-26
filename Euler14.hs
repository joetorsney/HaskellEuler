module Euler14 where
import Data.List
import Data.Ord

collatz :: Int -> Int
collatz 1 = 1
collatz n
    | even n = div n 2
    | otherwise = 3*n + 1

{- Given a reccurence relation, a stop condition, and a seed; sequenceGen
generates a sequence until the stop condition has been reached. -}
sequenceGen :: (Int -> Int) -> (Int -> Bool) -> [Int] -> [Int]
sequenceGen f p seed@(x:xs) =
    let next = f x 
        seq = next:seed
    in
        if p next then seq
        else sequenceGen f p seq


collatzGen :: Int -> [Int]
collatzGen seed = sequenceGen collatz ((==) 1) [seed]

longestCollatz :: Int -> [Int]
longestCollatz n = maximumBy (comparing length) (map collatzGen [1..n])

{-
Answer:
Longest collatz sequence up to 1000000 is n = 837799:
[1,2,4,8,16,5,10,20,40,80,160,53,106,35,70,23,46,92,184,61,122,244,488,976,
325,650,1300,433,866,1732,577,1154,2308,4616,9232,3077,6154,2051,4102,1367,
2734,911,1822,3644,7288,2429,4858,1619,3238,1079,2158,719,1438,479,958,319,
638,1276,425,850,283,566,1132,377,754,251,502,167,334,668,1336,445,890,1780,
593,1186,395,790,263,526,175,350,700,233,466,155,310,103,206,412,137,274,91,
182,364,121,242,484,161,322,107,214,71,142,47,94,31,62,124,41,82,164,328,109,
218,436,145,290,580,1160,2320,773,1546,515,1030,343,686,1372,457,914,1828,3656,
7312,2437,4874,9748,19496,38992,12997,25994,51988,17329,34658,69316,23105,46210,
92420,184840,61613,123226,41075,82150,27383,54766,109532,219064,73021,146042,
292084,97361,194722,64907,129814,43271,86542,28847,57694,115388,230776,76925,
153850,307700,615400,205133,410266,820532,1641064,547021,1094042,2188084,729361,
1458722,2917444,972481,1944962,3889924,1296641,2593282,864427,1728854,3457708,
1152569,2305138,768379,1536758,3073516,1024505,2049010,683003,1366006,455335,
910670,1821340,3642680,7285360,2428453,4856906,9713812,3237937,6475874,12951748,
25903496,51806992,17268997,34537994,69075988,23025329,46050658,15350219,30700438,
10233479,20466958,6822319,13644638,27289276,9096425,18192850,6064283,12128566,
4042855,8085710,16171420,5390473,10780946,21561892,7187297,14374594,28749188,
57498376,114996752,229993504,76664501,153329002,51109667,102219334,34073111,
68146222,22715407,45430814,90861628,30287209,60574418,121148836,40382945,
80765890,26921963,53843926,17947975,35895950,71791900,23930633,47861266,
15953755,31907510,63815020,21271673,42543346,85086692,170173384,56724461,
113448922,37816307,75632614,25210871,50421742,16807247,33614494,11204831,
22409662,7469887,14939774,29879548,9959849,19919698,6639899,13279798,26559596,
53119192,17706397,35412794,70825588,23608529,47217058,15739019,31478038,
10492679,20985358,6995119,13990238,27980476,9326825,18653650,6217883,12435766,
4145255,8290510,2763503,5527006,1842335,3684670,1228223,2456446,4912892,9825784,
3275261,6550522,2183507,4367014,1455671,2911342,5822684,11645368,3881789,
7763578,2587859,5175718,1725239,3450478,6900956,13801912,4600637,9201274,3067091,
6134182,2044727,4089454,1363151,2726302,908767,1817534,3635068,1211689,2423378,
4846756,1615585,3231170,6462340,2154113,4308226,1436075,2872150,957383,1914766,
638255,1276510,2553020,5106040,1702013,3404026,6808052,13616104,4538701,9077402,
18154804,6051601,12103202,24206404,48412808,96825616,32275205,64550410,21516803,
43033606,14344535,28689070,9563023,19126046,38252092,12750697,25501394,51002788,
102005576,204011152,68003717,136007434,272014868,544029736,181343245,362686490,
725372980,241790993,483581986,161193995,322387990,107462663,214925326,71641775,
143283550,47761183,95522366,191044732,382089464,764178928,254726309,509452618,
1018905236,2037810472,679270157,1358540314,452846771,905693542,301897847,603795694,
201265231,402530462,805060924,268353641,536707282,178902427,357804854,715609708,
238536569,477073138,159024379,318048758,636097516,212032505,424065010,141355003,
282710006,565420012,188473337,376946674,125648891,251297782,83765927,167531854,
335063708,670127416,223375805,446751610,148917203,297834406,99278135,198556270,
66185423,132370846,44123615,88247230,29415743,58831486,19610495,39220990,13073663,
26147326,52294652,104589304,34863101,69726202,23242067,46484134,92968268,185936536,
371873072,743746144,1487492288,2974984576,991661525,1983323050,661107683,1322215366,
440738455,881476910,1762953820,587651273,1175302546,391767515,783535030,261178343,
522356686,174118895,348237790,116079263,232158526,77386175,154772350,51590783,
103181566,34393855,68787710,137575420,45858473,91716946,30572315,61144630,20381543,
40763086,13587695,27175390,9058463,18116926,6038975,12077950,4025983,8051966,
16103932,5367977,10735954,3578651,7157302,2385767,4771534,1590511,3181022,6362044,
2120681,4241362,1413787,2827574,5655148,1885049,3770098,1256699,2513398,837799]
-}