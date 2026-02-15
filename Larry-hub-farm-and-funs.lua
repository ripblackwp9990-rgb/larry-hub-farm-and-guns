--By Rufus14, FPS unlocker really recommended to improve hitbox
tool = script.Parent
handle = tool.Handle
trail = handle.trail
players = game:GetService("Players")
runservice = game:GetService("RunService")
tweenservice = game:GetService("TweenService")
player = nil
character = nil
charhum = nil
validatetick = nil
parryfunc = nil
slicefunc = nil
lastswingtick = tick()
lastparrytick = tick()
equiptick = nil
swinganimation = 0
state = "unequipped"
hitpeople = {}
remote = tool.RemoteEvent
cfnew = CFrame.new
cfeuler = CFrame.fromEulerAnglesXYZ
rand = math.random
headoffset = 0
speedbuff = 3
animslowdownmult = 1
bloodpuddlesizemultiplier = 1.8
parrycooldown = 3
bleedingtime = 3
damage = 36
ragdolldespawntime = 10
swingids = {6241709963}
headshotids = {7025209172, 7025209359, 7025209663}
parryids = {7058511334, 7058511852, 7058511971}
decapids = {6425362825}
spinids = {608600954, 608494468}
bloodcolorfromtorso = false
actuallyparied = false
oldplayerws = 16
oldplayerjp = 50
oldplayerhealth = 100
 
function monar(WHAT, duration)
    game:GetService("Debris"):AddItem(WHAT, duration)
end
 
function pose(POSE, KEYFRAME, speeed, btick)
    if state ~= "unequipped" and btick == validatetick then
        pcall(function()
            local findhead = findthing("HeadWeld", character.Torso)
            local findrarm = findthing("RightArmWeld", character.Head)
            local findlarm = findthing("LeftArmWeld", character.Head)
            local findrleg = findthing("RightLegWeld", character.Torso)
            local findlleg = findthing("LeftLegWeld", character.Torso)
            local findrootpart = findthing("HumanoidRootPartWeld", character.HumanoidRootPart)
            local findhandle = findthing("RightGrip", character["Right Arm"])
            local startheadcf = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0,0.35,0)
            if POSE == "equip" then
                if KEYFRAME == 1 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhead, {C0 = startheadcf})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findlarm, {C0 = cfnew(-1.44015026, -1.21483612, -0.510011673, 0.939692616, -0.0593911, -0.336824089, -0.219846278, 0.649519145, -0.727868319, 0.262002617, 0.75802207, 0.59729147)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrarm, {C0 = cfnew(1.50723648, -0.872226715, -0.475799561, 0.993774354, -0.0206981599, 0.109471887, 0.105154656, -0.150392503, -0.983018041, 0.0368103981, 0.988409638, -0.147279769)})
                elseif KEYFRAME == 2 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0, findhead, {C0 = startheadcf})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0, findlarm, {C0 = cfnew(-0.806467056, -1.62165117, -0.794884682, 0.766044438, -0.642787576, 0, 0.413175881, 0.492403835, -0.766044259, 0.492403805, 0.586824, 0.642787635)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0, findrarm, {C0 = cfnew(0.806467056, -1.62165117, -0.794883728, 0.766044438, 0.642787576, 1.34110465e-07, -0.413175851, 0.492403924, -0.766044199, -0.492403805, 0.58682394, 0.642787695 )})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0, findrootpart, {C0 = cfnew()})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0, findhandle, {C0 = cfnew(-0.0361614227, -1.21160364, -1.67413998, -0.766044438, 0.111618906, 0.63302207, -0.642787576, -0.1330221, -0.754406452, -1.34110451e-07, -0.984807611, 0.17364794)})
                end
            elseif POSE == "swing" then
                if KEYFRAME == 1 then
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(-0.0434112549, 0, -0.0751914978, 0.866025388, -0.0868240893, 0.492403865, -7.4505806e-09, 0.98480767, 0.173648149, -0.49999997, -0.150383741, 0.852868438 ) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findlarm, {C0 = cfnew(1.10525131, -0.346797466, -0.610911369, 0.518183529, -0.848274708, 0.109158911, -0.846994162, -0.491261691, 0.203131348, -0.118685439, -0.19771643, -0.973047614)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.866025388, -0.0868240893, -0.492403865, 0, 0.98480773, -0.173648179, 0.5, 0.150383726, 0.852868497)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrarm, {C0 = cfnew(1.81095028, -0.792669296, -0.122826576, 0.963875651, -0.228141725, -0.137458891, -0.23417446, -0.971755028, -0.0292248353, -0.126908764, 0.0603585877, -0.990076005)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findhandle, {C0 = cfnew(-0.0190238953, -0.549611807, -1.82067871, -0.981861174, 0.00535122305, -0.189525232, 0.18533048, 0.238044456, -0.953408003, 0.0400138423, -0.971239328, -0.234718204)})
                elseif KEYFRAME == 2 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0, 0, 0, 1, -1.04308143e-07, -1.49011612e-07, 1.0430815e-07, 0.999999821, 1.65765769e-07, 2.08616228e-07, -1.93715067e-07, 0.999999881) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findlarm, {C0 = cfnew(-0.333414078, -1.1603899, -1.28833961, -0.117892452, -0.802119613, -0.585410416, -0.97422111, -0.0207587872, 0.224636063, -0.192337379, 0.596802056, -0.778994918)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 1, 0, 2.98023224e-08, 0, 0.99999994, 0, 2.98023224e-08, -1.49011612e-08, 0.99999994)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrarm, {C0 = cfnew(1.57797241, -1.13960147, -0.93402195, 0.677886784, -0.0921047777, -0.729373753, -0.707186043, 0.189408958, -0.681183755, 0.200890377, 0.977568626, 0.0632626489)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhandle, {C0 = cfnew(0.076672554, -1.0224762, -1.91989994, -0.988381743, 0.0340628475, -0.148095697, 0.147101954, -0.0299755335, -0.988663375, -0.0381166637, -0.998965383, 0.0246175826)})
                elseif KEYFRAME == 3 then
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0.0194320679, 0, 0.0230379105, 0.503339767, 0.0388669819, -0.863213837, -0.0593909621, 0.998181283, 0.0103131784, 0.862044811, 0.0460760593, 0.504732668) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findlarm, {C0 = cfnew(-1.66619301, -1.35887671, 0.900477409, 0.347174168, 0.935889959, -0.0598304197, -0.937460423, 0.34805873, 0.00472488534, 0.025246473, 0.054448206, 0.998196959)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.503340006, -0.111618757, 0.856848836, -0.0593910962, 0.98480773, 0.163175702, -0.862044871, -0.13302207, 0.489063919)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrarm, {C0 = cfnew(-0.775262833, -1.72180367, -1.46918297, 0.257305473, 0.91981864, 0.296187043, -0.845346093, 0.362754226, -0.392171323, -0.468169838, -0.149472997, 0.870904207)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findhandle, {C0 = cfnew(-0.0486164093, -1.80741692, -1.70041466, -0.988385677, -0.0317156464, -0.148615748, 0.147103667, -0.444996178, -0.883367658, -0.0381168537, -0.894970179, 0.444493681)})
                end
            elseif POSE == "swing2" then
                if KEYFRAME == 1 then
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0, 0, 0, 0.499999881, -1.93715096e-07, -0.866025388, -1.49011612e-08, 0.999999821, -2.08499841e-07, 0.866025388, 1.04308128e-07, 0.499999821) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findlarm, {C0 = cfnew(-1.26632309, -1.35090113, 1.35695839, -0.043412149, 0.829598188, 0.556670249, -0.413175851, 0.492403537, -0.766044378, -0.909615695, -0.263258487, 0.321393788)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.49999997, -0.150383741, 0.852868557, 0, 0.98480773, 0.173648179, -0.866025448, -0.0868240818, 0.492403835)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrarm, {C0 = cfnew(-0.190731049, -1.41545725, -1.84366465, -0.313556612, 0.859663248, 0.403312594, 0.936659455, 0.210210949, 0.280142605, 0.156047612, 0.465607256, -0.871125042)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findhandle, {C0 = cfnew(0.0359020233, -1.18655944, -1.69773293, -0.99903971, 0.0379881859, -0.0215185583, 0.0147992102, -0.169099867, -0.985478938, -0.0410740413, -0.984856904, 0.16837585)})
                elseif KEYFRAME == 2 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(-1.90734863e-06, 0, 0, 0.98480767, -1.94675067e-07, -0.173648372, 1.59529648e-07, 0.999999821, -1.30153737e-07, 0.173648268, 9.32407218e-08, 0.98480767) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findlarm, {C0 = cfnew(-1.85346794, -1.35090137, -0.0978221893, 0.668901265, 0.734923184, 0.111618809, -0.413175821, 0.492403537, -0.766044259, -0.617945373, 0.466289818, 0.63302207)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.98480773, 1.49011612e-08, 0.173648357, -1.95160688e-08, 0.99999994, 2.32583446e-08, -0.173648417, -2.23517418e-08, 0.98480773)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrarm, {C0 = cfnew(1.62541008, -0.550931454, -1.00405025, -0.500828028, -0.225280374, 0.835714996, 0.801650107, -0.484819978, 0.349722683, 0.326385826, 0.845102489, 0.423407525)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhandle, {C0 = cfnew(0.0359020233, -1.18655944, -1.69773293, -0.99903971, 0.0379881859, -0.0215185583, 0.0147992102, -0.169099867, -0.985478938, -0.0410740413, -0.984856904, 0.16837585)})
                elseif KEYFRAME == 3 then
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(-0.0184164047, 0, -0.0394973755, 0.906307757, -0.0368337184, 0.421010077, 2.04890966e-07, 0.996194601, 0.0871555358, -0.42261827, -0.0789896399, 0.902859092) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findlarm, {C0 = cfnew(-1.3277626, -1.3879056, -1.36363697, 0.962377727, 0.00575536489, -0.271653891, -0.232926458, 0.532265604, -0.813902915, 0.139907792, 0.846557558, 0.513581514 )})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.866025448, -0.0435778536, -0.49809736, 5.32907052e-15, 0.996194661, -0.0871556997, 0.5, 0.0754790604, 0.862729967)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findrarm, {C0 = cfnew(1.8669529, -0.645955563, 0.99232769, -0.597461581, -0.717176378, -0.358744264, 0.800334334, -0.505381048, -0.322574556, 0.050040368, -0.479841352, 0.875927091)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findhandle, {C0 = cfnew(0.0359020233, -1.18655944, -1.69773293, -0.99903971, 0.0379881859, -0.0215185583, 0.0147992102, -0.169099867, -0.985478938, -0.0410740413, -0.984856904, 0.16837585)})
                elseif KEYFRAME == 4 then
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(-0.0184164047, 0, -0.0394954681, 0.906307697, -0.036833711, 0.421010017, 2.05246465e-07, 0.996194661, 0.0871555358, -0.42261827, -0.0789896473, 0.902858973) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0, findlarm, {C0 = cfnew(-1.32776451, -1.3879056, -1.36363792, 0.962377548, 0.0057553798, -0.271653861, -0.232926458, 0.532265663, -0.813903034, 0.139907733, 0.846557438, 0.513581395)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.939692616, 3.7252903e-09, -0.342020184, 8.53839044e-09, 1, 3.93331376e-08, 0.342020154, -2.98023224e-08, 0.939692616) * cfeuler(0.1,-0.4,0)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0, findrarm, {C0 = cfnew(1.66443443, -1.47913337, 0.946339607, 0.24478662, -0.60071516, -0.761065364, 0.873036921, 0.478010893, -0.0964972153, 0.42176491, -0.640816987, 0.641457379)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0, findhandle, {C0 = cfnew(0.0359020233, -1.18655944, -1.69773293, -0.99903971, 0.0379881859, -0.0215185583, 0.0147992102, -0.169099867, -0.985478938, -0.0410740413, -0.984856904, 0.16837585)})
                end
            elseif POSE == "swing3" then
                if KEYFRAME == 1 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(-9.53674316e-07, 0, 0, 1, 8.44011083e-10, -1.21071935e-08, 8.44011083e-10, 0.99999994, 0, -1.21071935e-08, 0, 1) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findlarm, {C0 = cfnew(-0.876605034, -0.68309474, -0.88924408, 0.824110806, -0.556670368, -0.104687028, -0.363025188, -0.377203643, -0.852015138, 0.434803277, 0.740159035, -0.512943029)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.999619842, 0.0271295328, 0.00487130741, -0.0275630038, 0.984844267, 0.171235546, -0.000151902437, -0.171304792, 0.985218048) * cfeuler(0,-math.pi/2,0)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrarm, {C0 = cfnew(0.876605988, -0.68309474, -0.889242172, 0.824110806, 0.556670308, 0.104687028, 0.363025099, -0.377203435, -0.852015316, -0.434803486, 0.740159214, -0.512942791)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhandle, {C0 = cfnew(0.0889234543, -1.26559258, -1.66704273, -0.794784725, 0.295260459, 0.530224919, -0.589384019, -0.16718325, -0.790364504, -0.144718692, -0.940675676, 0.306896657)})
                elseif KEYFRAME == 2 then
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, -0.999992967, -0.00218574586, -0.00302373013, -0.00259801745, 0.989592612, 0.143872872, 0.00267777848, 0.143879741, -0.989591479)})
                elseif KEYFRAME == 3 then
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, -0.00269090617, -0.176192135, 0.984351993, 0.00505291298, 0.984340549, 0.176203862, -0.999983549, 0.00544799771, -0.00175847043)})
                elseif KEYFRAME == 4 then
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0, 0, 0, 0.98480767, 3.7252903e-09, 0.173648149, -3.46973899e-08, 0.99999994, 2.08616257e-07, -0.173648149, -1.78813934e-07, 0.984807551) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.999992847, -0.00301244156, 0.00220119907, 0.00259798742, 0.985669076, 0.16866897, -0.00267774635, -0.168662101, 0.985670209)})
                elseif KEYFRAME == 5 then
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0, 0, 0, 0.766044617, 1.51420721e-07, 0.642787516, -5.98007404e-08, 1, -1.64301071e-07, -0.642787516, 8.74227624e-08, 0.766044617) * cfnew(0,0.35,0)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findlarm, {C0 = cfnew(0.0016746521, -0.961540222, -1.22285843, 0.0597488321, -0.980557978, -0.186909884, -0.995255589, -0.0729201585, 0.0644006208, -0.076778017, 0.18217501, -0.98026371)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findrootpart, {C0 = cfnew(0, 0, 0, 0.499999702, 0, -0.866025627, 0, 1, 0, 0.866025627, 0, 0.499999702)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findrarm, {C0 = cfnew(2.0153923, -0.72571063, 0.879398346, -0.0795951486, -0.993162811, -0.0853892565, 0.991188586, -0.0879518017, 0.0990364254, -0.105869673, -0.0767543465, 0.991413116)})
                    tween(speeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findhandle, {C0 = cfnew(0.413618088, -1.95290947, -1.42747879, -0.955172837, 0.258495659, -0.144297406, -0.0294617563, -0.56799978, -0.822499931, -0.294573754, -0.7813797, 0.550155461)})
                end
            elseif POSE == "parry" then
                if KEYFRAME == 1 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = cfnew(-2.86102295e-06, 1.49998641, -1.90734863e-06, 0.342018098, -1.65216625e-06, 0.939690888, -7.4505806e-09, 0.999991, -1.77635229e-06, -0.939686537, -5.99771738e-07, 0.342019409)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findlarm, {C0 = cfnew(0.901594162, -1.32347822, -0.197136879, 0.143755198, -0.0773586929, 0.986578584, 0.882555306, -0.440967113, -0.163174614, 0.447674662, 0.894181073, 0.00488291308)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrootpart, {C0 = cfnew(-0.0118789673, -0.203036547, -0.0326347351, 0.336822152, -0.0593906455, -0.939686477, 0.173646167, 0.98479867, -3.4137355e-07, 0.925415277, -0.163176209, 0.342019528)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrarm, {C0 = cfnew(1.0626297, -1.06209946, -0.0650787354, 0.173646837, 1.99768692e-07, 0.984801412, 0.969837129, -0.173648328, -0.171008199, 0.171008036, 0.98480612, -0.0301532429)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findhandle, {C0 = cfnew(-0.00456058979, -2.48153496, -0.0186843872, -0.955164194, 0.030058451, -0.294546902, -0.0294590909, -0.999545097, -0.00647266675, -0.29460746, 0.00249462551, 0.955615103)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrleg, {C0 = cfnew(0.872175694, -2.11068511, 3.81469727e-06, 0.939689875, -0.342020959, 1.40070915e-06, 0.342015445, 0.939684629, -6.03497028e-07, 1.10268593e-06, -1.04308128e-06, 0.99999404)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findlleg, {C0 = cfnew(-1.05737257, -1.62676859, -0.219942093, 0.940149069, 0.339419574, 0.030154705, -0.339420617, 0.924949646, 0.171007872, 0.0301550031, -0.171009108, 0.984801829)})
                elseif KEYFRAME == 2 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = cfnew(0, 1.40954661, 0.28676796, 1, -5.39914254e-07, -4.47039042e-07, 1.85861694e-07, 0.819152832, -0.573575437, 6.75874787e-07, 0.573575377, 0.819152832)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findlarm, {C0 = cfnew(-0.429336548, -1.00871325, -1.33772755, 0.984801352, -0.172986597, 0.0151341371, 0.0151344296, -0.00131911295, -0.999875188, 0.172987774, 0.984921634, 0.00131988712)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrootpart, {C0 = cfnew(0, -0.617840767, -0.494980812, 0.999993563, 6.19543812e-08, 2.25289909e-07, 1.7997111e-07, 0.819144428, 0.573571026, 1.49011044e-07, -0.57357651, 0.819150507)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrarm, {C0 = cfnew(0.389614105, -1.01415372, -1.39992189, 0.965919554, 0.257832646, -0.0225576032, -0.0225570872, -0.00295865815, -0.999731779, -0.25783366, 0.966183484, 0.00295909657)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findhandle, {C0 = cfnew(0.187524796, -2.42712927, -0.0307271481, -0.960426033, 0.271946609, 0.0602244027, -0.27195397, -0.962275028, 0.00823253393, 0.0601912513, -0.00847152341, 0.998150945)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrleg, {C0 = cfnew(0.499992371, -2.13795662, 0.419466019, 1, 5.65172051e-08, -6.98682413e-07, 1.85861694e-07, 0.9396891, 0.342029929, 6.75874787e-07, -0.342029929, 0.9396891)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findlleg, {C0 = cfnew(-0.499990463, -0.670339346, -1.34637785, 1, -6.78257038e-07, -1.76970985e-07, 1.85861694e-07, 0.499993026, -0.866029501, 6.75874787e-07, 0.866029501, 0.499992996)})
                elseif KEYFRAME == 3 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhead, {C0 = cfnew(0, 1.49808466, 0.0435743332, 0.999993563, 1.51361462e-07, 1.77998857e-07, 1.35271748e-07, 0.996185958, -0.0871579498, 1.90513617e-07, 0.0871537328, 0.996192634)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findlarm, {C0 = cfnew(-1.44930458, -0.834447384, -0.797714233, 0.941139936, 0.337688953, 0.0144438297, 0.0715859234, -0.157381371, -0.984930634, -0.330331385, 0.92800492, -0.172290504)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrootpart, {C0 = cfnew(0, 0.110053539, -0.00343513489, 0.999993563, 1.35271748e-07, 1.90513617e-07, 1.7997111e-07, 0.965916872, 0.25881663, 1.49011044e-07, -0.25881961, 0.965924263)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrarm, {C0 = cfnew(-0.362801552, -1.00685477, -1.16335297, -0.0252703037, 0.862672448, -0.505131364, 0.975723982, 0.131241634, 0.175324127, 0.217541575, -0.488438249, -0.84504658)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findhandle, {C0 = cfnew(0.0678982735, -1.63876772, -1.6992836, -0.960412204, 0.0364360884, 0.276190013, -0.272002608, -0.336854935, -0.901411951, 0.0601920374, -0.940851271, 0.33343032)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findrleg, {C0 = cfnew(0.499990463, -2.13794041, 0.419459343, 1, -1.85854347e-07, -6.7587689e-07, 4.05815683e-07, 0.939688921, 0.342030555, 5.71546025e-07, -0.342030525, 0.939688921)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, findlleg, {C0 = cfnew(-0.499990463, -1.82915878, -1.20715046, 1, -6.37221092e-07, -2.92062737e-07, 4.05815683e-07, 0.866023302, -0.500003815, 5.71546025e-07, 0.500003815, 0.866023302)})
                elseif KEYFRAME == 4 then
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findhead, {C0 = cfnew(0.0613927841, 1.49586678, -0.0182418823, 0.707104743, 0.122787073, -0.696359098, -0.061628405, 0.991752684, 0.112293229, 0.70441556, -0.0364881307, 0.708845139)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findlarm, {C0 = cfnew(-1.45631075, -1.61514974, 0.858612061, -0.159541398, 0.823127031, 0.54498136, 0.316107392, 0.565577507, -0.761694908, -0.935206056, 0.0507521033, -0.350429177)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrootpart, {C0 = cfnew(0, 0.010434866, 0.00528049469, 0.866522372, 0.0320669971, -0.498094201, -0.0436544456, 0.998969615, -0.0116322422, 0.49721542, 0.0318230875, 0.867041707)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrarm, {C0 = cfnew(1.27984476, -1.29986334, -1.68792152, 0.702379942, -0.36221078, 0.612749696, 0.711705089, 0.371021271, -0.596489966, -0.0112873912, 0.855062604, 0.518389583)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findhandle, {C0 = cfnew(0.510777473, -2.92113781, -0.426809311, -0.960421741, 0.2573888, 0.106494546, -0.271978766, -0.949076772, -0.158999994, 0.0601466894, -0.181671321, 0.981518209)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findrleg, {C0 = cfnew(0.761685371, -1.95332146, -0.144449234, 0.984808087, -0.17298606, 0.015127738, 0.173646256, 0.981060505, -0.085832946, 6.67582299e-06, 0.0871558487, 0.99619472)})
                    tween(speeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, findlleg, {C0 = cfnew(-0.670157433, -1.95244908, 0.142192841, 0.995965123, 0.0780069456, 0.0443671234, -0.0844863355, 0.981733739, 0.170472875, -0.0302586295, -0.17353344, 0.984363079)})
                end
            elseif POSE == "r6stance" then
                if KEYFRAME == 1 then
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = startheadcf})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findlarm, {C0 = cfnew(-0.806467056, -1.62165117, -0.794884682, 0.766044438, -0.642787576, 0, 0.413175881, 0.492403835, -0.766044259, 0.492403805, 0.586824, 0.642787635)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrarm, {C0 = cfnew(0.806467056, -1.62165117, -0.794883728, 0.766044438, 0.642787576, 1.34110465e-07, -0.413175851, 0.492403924, -0.766044199, -0.492403805, 0.58682394, 0.642787695 )})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrootpart, {C0 = cfnew()})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findhandle, {C0 = cfnew(-0.0361614227, -1.21160364, -1.67413998, -0.766044438, 0.111618906, 0.63302207, -0.642787576, -0.1330221, -0.754406452, -1.34110451e-07, -0.984807611, 0.17364794)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findrleg, {C0 = cfnew(0.5,-2,0)})
                    tween(speeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0, findlleg, {C0 = cfnew(-0.5,-2,0)})
                end
            end
        end)
    end
end
 
function tooltransparency(transparency)
    table.foreach(tool:GetDescendants(), function(_, XD) if XD:IsA("BasePart") then XD.Transparency = transparency end end)
    end
        function searchfornearesthead(maxrange)
            local closestdistance = maxrange
            local guyhead
            for i,v in pairs(workspace:GetDescendants()) do
                local hhhh = v:FindFirstChildOfClass("Humanoid")
                if hhhh and v ~= character then
                    if hhhh.Health > 0 then
                        local foundhead = v:FindFirstChild("Head")
                        if foundhead then
                            local mag = (foundhead.Position - character.Head.Position).magnitude
                            if mag < closestdistance then
                                closestdistance = mag
                                guyhead = foundhead
                            end
                        end
                    end
                end
            end
            return guyhead, closestdistance
        end
        function weldlimb(part0, part1, startc0, name)
            local a = Instance.new("Weld", part0)
            a.Part0 = part0
            a.Part1 = part1
            a.C0 = startc0
            a.Name = name
        end
        function playsound(id, volume, speed, debris, timeposition, parent)
            pcall(function() --pcalling sounds because void has trash sound limit that breaks scripts if you dont do that
                local s = Instance.new("Sound")
                if parent ~= nil then
                    s.Parent = parent
                else
                    s.Parent = handle
                end
                s.SoundId = "rbxassetid://"..tostring(id)
                s.Volume = volume
                s.PlaybackSpeed = speed
                s.TimePosition = timeposition
                s:Play()
                monar(s, debris)
            end)
        end
        function playswingid()
            local rand = math.random(1,#swingids)
            playsound(swingids[rand], 1.5, 1.5+math.random(-10,10)/70, 4, 0)
        end
        function playheadshotid()
            local rand = math.random(1,#headshotids)
            playsound(headshotids[rand], 1, 1+math.random(-10,10)/70, 4, 0.2)
        end
        function playspinid()
            local rand = math.random(1,#spinids)
            playsound(spinids[rand], 0.5, 1+math.random(-10,10)/70, 4, 0)
        end
        function playparryid()
            local rand = math.random(1,#parryids)
            playsound(parryids[rand], 0.5, 1+math.random(-10,10)/70, 4, 0)
        end
        function tween(speed, easingstyle, easingdirection, loopcount, reverseafterfinish, delaytime, WHAT, goal)
            local info = TweenInfo.new(speed, easingstyle, easingdirection, loopcount, reverseafterfinish, delaytime)
            local goals = goal
            local anim = tweenservice:Create(WHAT, info, goals)
            anim:Play()
        end
        function findthing(WHAT, parent)
            local thing = parent:FindFirstChild(WHAT, true)
            if thing then
                return thing
            else return nil end
            end
                function push(WHAT, force, debris)
                    local v = Instance.new("BodyVelocity", WHAT)
                    v.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                    v.Velocity = (WHAT.Position - character.Head.Position).unit*force
                    monar(v, debris)
                end
                function makeballconnections(limb, attachementone, attachmenttwo, twistlower, twistupper, du)
                    local connection = Instance.new('BallSocketConstraint', limb)
                    local bone = Instance.new("Part", limb)
                    connection.LimitsEnabled = true
                    connection.Attachment0 = attachementone
                    connection.Attachment1 = attachmenttwo
                    connection.TwistLimitsEnabled = true
                    connection.TwistLowerAngle = twistlower
                    connection.TwistUpperAngle = twistupper
                    bone:BreakJoints()
                    local bonew = Instance.new("Weld", bone)
                    bonew.Part0 = limb
                    bonew.Part1 = bone
                    bonew.C0 = cfeuler(0,0,math.pi/2) * cfnew(-limb.Size.y/4.5,0,0)
                    if limb.Parent:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
                        bone.Size = Vector3.new(limb.Size.y/1.8,limb.Size.z,limb.Size.x)
                    else
                        bone.Size = Vector3.new(limb.Size.y/3,limb.Size.z,limb.Size.x)
                    end
                    bone.Transparency = 1
                    bone.Shape = "Cylinder"
                    local noc = Instance.new("NoCollisionConstraint", bone)
                    noc.Part0 = attachementone.Parent
                    noc.Part1 = attachmenttwo.Parent
                    monar(bone, du)
                    monar(connection, du)
                end
                function makehingeconnections(limb, attachementone, attachmenttwo, lower, upper, du)
                    local connection = Instance.new('HingeConstraint', limb)
                    local bone = Instance.new("Part", limb)
                    connection.LimitsEnabled = true
                    connection.Attachment0 = attachementone
                    connection.Attachment1 = attachmenttwo
                    connection.LimitsEnabled = true
                    connection.LowerAngle = lower
                    connection.UpperAngle = upper
                    bone:BreakJoints()
                    local bonew = Instance.new("Weld", bone)
                    bonew.Part0 = limb
                    bonew.Part1 = bone
                    bonew.C0 = cfeuler(0,0,math.pi/2) * cfnew(-limb.Size.y/4.5,0,0)
                    if limb.Parent:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
                        bone.Size = Vector3.new(limb.Size.y/1.8,limb.Size.z,limb.Size.x)
                    elseif limb.Parent:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
                        bone.Size = Vector3.new(limb.Size.y/3,limb.Size.z,limb.Size.x)
                    elseif limb.Name == "Head" then
                        bone.Size = Vector3.new(limb.Size.y/5,limb.Size.z,limb.Size.x)
                    end
                    bone.Transparency = 1
                    bone.Shape = "Cylinder"
                    local noc = Instance.new("NoCollisionConstraint", bone)
                    noc.Part0 = attachementone.Parent
                    noc.Part1 = attachmenttwo.Parent
                    monar(bone, du)
                    monar(connection, du)
                end
                function headshotdeath(ch)
                    local ched = ch:FindFirstChild("Head")
                    if ched then
                        Instance.new("BoolValue", ch).Name = "diedbydecapitation"
                        local soundpart = Instance.new("Part", workspace)
                        soundpart.Anchored = true
                        soundpart.Size = Vector3.new()
                        soundpart.CanCollide = false
                        soundpart.CFrame = ched.CFrame
                        soundpart.Transparency = 1
                        playsound("4307125957", 1, 1+math.random(-10,10)/70, 2, 0.05)
                        playsound("4086201929", 1, 1+math.random(-10,10)/70, 3, 0, soundpart)
                        playsound("4086193139", 0.5, 1+math.random(-10,10)/70, 5, 0, soundpart)
                        monar(soundpart, 6)
                    end
                end
                function makeragdolllimbr6(limb, dudetorso, at1pos, at2pos, lowt, upt, duratio)
                    local at1 = Instance.new("Attachment", dudetorso)
                    local at2 = Instance.new("Attachment", limb)
                    at1.Position = at1pos
                    at2.Position = at2pos
                    makeballconnections(limb, at1, at2, lowt, upt, duratio)
                    game.Debris:AddItem(at1, duratio)
                    game.Debris:AddItem(at2, duratio)
                end
                function ragdollify(ch, duration, dea)
                    local chum = ch:FindFirstChildOfClass("Humanoid")
                    if chum then
                        if not chum.PlatformStand then
                            chum.PlatformStand = true
                            if dea then
                                chum.RequiresNeck = false
                                chum.Health = 0
                                local hpsc = ch:FindFirstChild("Health")
                                if hpsc then
                                    if hpsc:IsA("Script") then
                                        hpsc.Disabled = true
                                    end
                                end
                                if ch:FindFirstChild("HumanoidRootPart") then
                                    ch:FindFirstChild("HumanoidRootPart"):Destroy()
                                end
                                push(ch.Head, 10, 0.3)
                                monar(ch, ragdolldespawntime)
                            elseif ch:FindFirstChild("HumanoidRootPart") then
                                if ch:FindFirstChild("HumanoidRootPart").CanCollide then
                                    ch:FindFirstChild("HumanoidRootPart").CanCollide = false
                                    coroutine.wrap(function()
                                        task.wait(duration)
                                        if ch:FindFirstChild("HumanoidRootPart") then
                                            ch:FindFirstChild("HumanoidRootPart").CanCollide = true
                                        end
                                    end)()
                                end
                            end
                            local savedglue = {}
                            local mainpart
                            if chum.RigType == Enum.HumanoidRigType.R6 then
                                local chtor = ch.Torso
                                mainpart = chtor
                                if not dea then
                                    for i,v in pairs(chtor:GetChildren()) do
                                        if v:IsA("Motor6D") then
                                            if v.Part1.Name ~= "Head" and v.Part0.Name ~= "HumanoidRootPart" then
                                                table.insert(savedglue, {v, v.Part0, v.Part1})
                                                v.Part1 = nil
                                                v.Part0 = nil
                                            end
                                        end
                                    end
                                end
                                pcall(function()
                                    makeragdolllimbr6(ch["Right Arm"], ch.Torso, Vector3.new((ch.Torso.Size.x/2) + (ch.Torso.Size.x/4), (ch.Torso.Size.y/4), 0), Vector3.new(0,ch["Right Arm"].Size.y/4,0), -180, 180, duration)
                                end)
                                pcall(function()
                                    makeragdolllimbr6(ch["Left Arm"], ch.Torso, Vector3.new(-(ch.Torso.Size.x/2) - (ch.Torso.Size.x/4), (ch.Torso.Size.y/4), 0), Vector3.new(0,ch["Left Arm"].Size.y/4,0), -180, 180, duration)
                                end)
                                pcall(function()
                                    makeragdolllimbr6(ch["Left Leg"], ch.Torso, Vector3.new(-(ch.Torso.Size.x/4), -(ch.Torso.Size.y/2), 0), Vector3.new(0,ch["Left Leg"].Size.y/2,0), -80, 80, duration)
                                end)
                                pcall(function()
                                    makeragdolllimbr6(ch["Right Leg"], ch.Torso, Vector3.new((ch.Torso.Size.x/4), -(ch.Torso.Size.y/2), 0), Vector3.new(0,ch["Right Leg"].Size.y/2,0), -80, 80, duration)
                                end)
                                if dea == true and not ch:FindFirstChild("diedbydecapitation") then
                                    if ch.Torso:findFirstChild("NeckAttachment") then
                                        local headattachment = Instance.new("Attachment", ch.Head)
                                        headattachment.Position = Vector3.new(0,-ch.Head.Size.y/2,0)
                                        makehingeconnections(ch.Head, headattachment, ch.Torso.NeckAttachment, -50, 50, ragdolldespawntime)
                                    else
                                        local wed = Instance.new("Weld", ch.Head)
                                        wed.Part1 = ch.Head
                                        wed.Part0 = ch.Torso
                                        wed.C0 = cfnew(0,(ch.Torso.Size.y/2)+(ch.Head.Size.y/2),0)
                                    end
                                end
                                if not dea then
                                    coroutine.wrap(function()
                                        task.wait(duration)
                                        for i,v in pairs(savedglue) do
                                            v[1].Part0 = v[2]
                                            v[1].Part1 = v[3]
                                            savedglue[i] = nil
                                        end
                                        chum.PlatformStand = false
                                    end)()
                                end
                            elseif chum.RigType == Enum.HumanoidRigType.R15 then
                                local chuppertor = ch.UpperTorso
                                mainpart = chuppertor
                                if not dea then
                                    for i,v in pairs(ch:GetDescendants()) do
                                        if v:IsA("Motor6D") then
                                            if v.Part1.Name ~= "Head" and v.Part0.Name ~= "HumanoidRootPart" then
                                                table.insert(savedglue, {v, v.Part0, v.Part1})
                                                v.Part1 = nil
                                                v.Part0 = nil
                                            end
                                        end
                                    end
                                end
                                if dea == true and not ch:FindFirstChild("diedbydecapitation") then
                                    if ch.UpperTorso:findFirstChild("NeckAttachment") then
                                        local HeadAttachment = Instance.new("Attachment", ch.Head)
                                        HeadAttachment.Position = Vector3.new(0, -0.5, 0)
                                        makehingeconnections(ch.Head, HeadAttachment, ch.UpperTorso.NeckAttachment, -50, 50, ragdolldespawntime)
                                    else
                                        local wed = Instance.new("Weld", ch.Head)
                                        wed.Part1 = ch.Head
                                        wed.Part0 = ch.UpperTorso
                                        wed.C0 = cfnew(0,(ch.UpperTorso.Size.y/2)+(ch.Head.Size.y/2),0)
                                    end
                                end
                                pcall(function()
                                    makehingeconnections(ch.LowerTorso, ch.LowerTorso.WaistRigAttachment, ch.UpperTorso.WaistRigAttachment, -50, 50, duration)
                                    makeballconnections(ch.LeftUpperArm, ch.LeftUpperArm.LeftShoulderRigAttachment, ch.UpperTorso.LeftShoulderRigAttachment, -200, 200, duration)
                                    makehingeconnections(ch.LeftLowerArm, ch.LeftLowerArm.LeftElbowRigAttachment, ch.LeftUpperArm.LeftElbowRigAttachment, 0, -60, duration)
                                    makehingeconnections(ch.LeftHand, ch.LeftHand.LeftWristRigAttachment, ch.LeftLowerArm.LeftWristRigAttachment, -20, 20, duration)
                                    --
                                    makeballconnections(ch.RightUpperArm, ch.RightUpperArm.RightShoulderRigAttachment, ch.UpperTorso.RightShoulderRigAttachment, -200, 200, duration)
                                    makehingeconnections(ch.RightLowerArm, ch.RightLowerArm.RightElbowRigAttachment, ch.RightUpperArm.RightElbowRigAttachment, 0, -60, duration)
                                    makehingeconnections(ch.RightHand, ch.RightHand.RightWristRigAttachment, ch.RightLowerArm.RightWristRigAttachment, -20, 20, duration)
                                    --
                                    makeballconnections(ch.RightUpperLeg, ch.RightUpperLeg.RightHipRigAttachment, ch.LowerTorso.RightHipRigAttachment, -80, 80, duration)
                                    makehingeconnections(ch.RightLowerLeg, ch.RightLowerLeg.RightKneeRigAttachment, ch.RightUpperLeg.RightKneeRigAttachment, 0, 60, duration)
                                    makehingeconnections(ch.RightFoot, ch.RightFoot.RightAnkleRigAttachment, ch.RightLowerLeg.RightAnkleRigAttachment, -20, 20, duration)
                                    --
                                    makeballconnections(ch.LeftUpperLeg, ch.LeftUpperLeg.LeftHipRigAttachment, ch.LowerTorso.LeftHipRigAttachment, -80, 80, duration)
                                    makehingeconnections(ch.LeftLowerLeg, ch.LeftLowerLeg.LeftKneeRigAttachment, ch.LeftUpperLeg.LeftKneeRigAttachment, 0, 60, duration)
                                    makehingeconnections(ch.LeftFoot, ch.LeftFoot.LeftAnkleRigAttachment, ch.LeftLowerLeg.LeftAnkleRigAttachment, -20, 20, duration)
                                end)
                                if not dea then
                                    coroutine.wrap(function()
                                        task.wait(duration)
                                        for i,v in pairs(savedglue) do
                                            v[1].Part0 = v[2]
                                            v[1].Part1 = v[3]
                                            savedglue[i] = nil
                                        end
                                        chum.PlatformStand = false
                                    end)()
                                end
                            end
                            if dea then
                                for i,v in pairs(ch:GetChildren()) do
                                    if v:IsA("Accessory") then
                                        if v:FindFirstChild("Handle") then
                                            local attachment1 = v.Handle:FindFirstChildOfClass("Attachment")
                                            if attachment1 then
                                                for q,w in pairs(ch:GetChildren()) do
                                                    if w:IsA("Part") then
                                                        local attachment2 = w:FindFirstChild(attachment1.Name)
                                                        if attachment2 then
                                                            local hinge = Instance.new("HingeConstraint", v.Handle)
                                                            hinge.Attachment0 = attachment1
                                                            hinge.Attachment1 = attachment2
                                                            hinge.LimitsEnabled = true
                                                            hinge.LowerAngle = 0
                                                            hinge.UpperAngle = 0
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if ch:FindFirstChild("diedbydecapitation") then
                                    local cutpart = Instance.new("Part", mainpart)
                                    cutpart.Size = Vector3.new(0.05,0.5,0.5)
                                    cutpart.CanCollide = false
                                    cutpart.Material = "Pebble"
                                    cutpart.Shape = "Cylinder"
                                    if bloodcolorfromtorso then
                                        cutpart.Color = mainpart.Color
                                    else
                                        cutpart.BrickColor = BrickColor.new("Maroon")
                                    end
                                    cutpart:BreakJoints()
                                    local cutweld = Instance.new("Weld", cutpart)
                                    cutweld.Part0 = mainpart
                                    cutweld.Part1 = cutpart
                                    cutweld.C0 = cfeuler(0,0,math.pi/2) * cfnew((mainpart.Size.y/2),0,0)
                                    local pe = Instance.new("ParticleEmitter", cutpart)
                                    if bloodcolorfromtorso then
                                        pe.Color = ColorSequence.new(mainpart.Color)
                                    else
                                        pe.Color = ColorSequence.new(Color3.fromRGB(100,0,0))
                                    end
                                    pe.LightEmission = 0
                                    pe.LightInfluence = 1
                                    pe.EmissionDirection = "Right"
                                    pe.Orientation = Enum.ParticleOrientation.VelocityParallel
                                    pe.Size = NumberSequence.new(1,0)
                                    pe.Texture = "rbxassetid://243132757"
                                    pe.Transparency = NumberSequence.new(0,0.4)
                                    pe.Lifetime = NumberRange.new(0.25,0.4)
                                    pe.Rate = 300
                                    pe.Rotation = NumberRange.new(90)
                                    pe.RotSpeed = NumberRange.new(0)
                                    pe.Speed = NumberRange.new(15)
                                    pe.SpreadAngle = Vector2.new(-15,15)
                                    pe.Drag = NumberRange.new(1)
                                    pe.Acceleration = Vector3.new(rand(-20,20),-50,rand(-20,20))
                                    local pplandotherstuff = {}
                                    local hitgroundalready = false
                                    table.foreach(workspace:GetDescendants(), function(z,x)
                                        if x:FindFirstChildOfClass("Humanoid") then
                                            table.insert(pplandotherstuff, x)
                                        elseif x:IsA("BasePart") then
                                            if not x.CanCollide then
                                                table.insert(pplandotherstuff, x)
                                            end
                                        end
                                    end)
                                    coroutine.wrap(function()
                                        local hit,position,surface
                                        local bloodincreasefunc
                                        for i = 1,ragdolldespawntime*10 do
                                            task.wait(0.1)
                                            local ray = Ray.new(cutpart.Position, Vector3.new(0,-(mainpart.Size.z/2)+(-1),0))
                                            hit,position,surface = workspace:FindPartOnRayWithIgnoreList(ray, pplandotherstuff)
                                            if hit ~= nil then
                                                hitgroundalready = true
                                                break
                                            end
                                        end
                                        if hitgroundalready then
                                            local bloodpartfloor = Instance.new("Part", workspace)
                                            bloodpartfloor.Size = Vector3.new(0.05,0.5,0.5)
                                            bloodpartfloor.CanCollide = false
                                            bloodpartfloor.Material = "Glass"
                                            bloodpartfloor.Shape = "Cylinder"
                                            bloodpartfloor.Anchored = true
                                            bloodpartfloor.CFrame = cfnew(position, position-surface) * cfeuler(math.pi/2,0,math.pi/2)
                                            bloodpartfloor:BreakJoints()
                                            monar(bloodpartfloor, ragdolldespawntime+2)
                                            if bloodcolorfromtorso then
                                                bloodpartfloor.Color = mainpart.Color
                                            else
                                                bloodpartfloor.BrickColor = BrickColor.new("Maroon")
                                            end
                                            local delta
                                            local lastframe = tick()
                                            local bloodtime = 0
                                            bloodincreasefunc = runservice.Stepped:Connect(function()
                                                delta = tick() - lastframe
                                                bloodtime = bloodtime + delta
                                                bloodpartfloor.Size = bloodpartfloor.Size + Vector3.new(0,delta*bloodpuddlesizemultiplier, delta*bloodpuddlesizemultiplier)
                                                if bloodtime > bleedingtime then
                                                    pe.Enabled = false
                                                    bloodincreasefunc:Disconnect()
                                                end
                                                lastframe = tick()
                                            end)
                                        end
                                    end)()
                                end
                            end
                        end
                    end
                end
                
                function ragdollkilldude(who)
                    who.Archivable = true
                    table.foreach(who:GetDescendants(), function(_,hi) 
                        if hi:IsA("Sound") then
                            hi:Destroy()
                        end
                    end)
                    local clr = who:Clone()
                    table.foreach(who:GetChildren(), function(_,hi) 
                        if hi:IsA("BasePart") or hi:IsA("ForceField") or hi:IsA("Accessory") or hi:IsA("Hat") then
                            hi:Destroy()
                        end
                    end)
                    clr.Parent = workspace
                    clr:BreakJoints()
                    ragdollify(clr, ragdolldespawntime, true)
                end
                function selectionbox(part, linet, surt, color3, surcolor3, transp, maxtime)
                    local boxfunc
                    local frametick = tick()
                    local timepassed = tick()
                    local delta
                    local selbox = Instance.new("SelectionBox", part)
                    selbox.LineThickness = linet
                    selbox.SurfaceTransparency = surt
                    selbox.Color3 = color3
                    selbox.SurfaceColor3 = color3
                    selbox.Transparency = transp
                    selbox.Adornee = part
                    monar(selbox, maxtime)
                    tween(maxtime, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, selbox, {Transparency = 1})
                    tween(maxtime, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0, selbox, {SurfaceTransparency = 1})
                end
                function removeselbox(part)
                    table.foreach(character:GetDescendants(), function(a,b)
                        if b:IsA("SelectionBox") then
                            if part == true then
                                b:Destroy()
                            elseif part:IsA("BasePart") then
                                if b.Adornee == part then
                                    b:Destroy()
                                end
                            end
                        end
                    end)
                end
                
                function hitperson(hispart, headshotknockback)
                    local findh = hispart.Parent:FindFirstChildOfClass("Humanoid")
                    if findh then
                        if findh.Health > 0 then
                            local him = table.find(hitpeople, findh.Parent)
                            if not him then
                                playsound("2900321088", 2, 1+math.random(-10,10)/70, 2, 0.2)
                                if not findh:FindFirstChild("dontchangews") then
                                    coroutine.wrap(function()
                                        findh.WalkSpeed = findh.WalkSpeed - 1
                                        findh.JumpHeight = findh.JumpHeight - 1
                                        wait(0.5)
                                        findh.WalkSpeed = findh.WalkSpeed + 1
                                        findh.JumpHeight = findh.JumpHeight + 1
                                    end)()
                                end
                                if hispart.Name == "Head" then
                                    playheadshotid()
                                    if swinganimation == 0 then --this is the number before 360 spin headshot insta kill move
                                        headshotdeath(findh.Parent)
                                        ragdollkilldude(findh.Parent)
                                        return
                                    elseif findh.Health < damage then
                                        headshotdeath(findh.Parent)
                                    end
                                end
                                if findh.Health > damage then
                                    findh.Health = findh.Health - damage
                                    if findh.PlatformStand then
                                        push(hispart, 5, 0.3)
                                    end
                                    if hispart.Name == "Head" then
                                        ragdollify(findh.Parent, 1, false)
                                        push(hispart, headshotknockback, 0.3)
                                    end
                                else
                                    if hispart.Name == "Head" then
                                        playheadshotid()
                                    end
                                    ragdollkilldude(findh.Parent)
                                end
                            end
                        end
                    end
                end
                
                remote.OnServerEvent:Connect(function(WHO, WHAT, parameter1)
                    if WHO == player and state ~= "unequipped" then
                        if WHAT == "1" then
                            headoffset = parameter1
                            local findhead = findthing("HeadWeld", character.Torso)
                            if findhead and state ~= "swinging" and state ~= "inparrymode" and state ~= "unforeseenconsequence" then
                                tween(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0, findhead, {C0 = cfnew(0,1.15,0) * cfeuler(-headoffset/1.5,0,0) * cfnew(0,0.35,0)})
                            end
                        elseif WHAT == "2" and state == "swinging" then
                            if (handle.Position - parameter1.Position).magnitude < 11 then
                                hitperson(parameter1, 15)
                            end
                        elseif WHAT == "3" and state == "idle" and tick() > lastparrytick + parrycooldown and not charhum.PlatformStand then
                            state = "inparrymode"
                            actuallyparied = false
                            local backuptick = equiptick
                            local donot = Instance.new("BoolValue", charhum)
                            donot.Name = "dontchangews"
                            charhum.WalkSpeed = charhum.WalkSpeed - 16
                            charhum.JumpHeight = charhum.JumpHeight - 7.2
                            weldlimb(character.Torso, character["Right Leg"], cfnew(0.5,-2,0), "RightLegWeld")
                            weldlimb(character.Torso, character["Left Leg"], cfnew(-0.5,-2,0), "LeftLegWeld")
                            pose("parry", 1, 0.2*animslowdownmult, backuptick)
                            task.wait(1*animslowdownmult)
                            if not actuallyparied then
                                state = "fail"
                                pose("r6stance", 1, 0.4*animslowdownmult, backuptick)
                                charhum.WalkSpeed = charhum.WalkSpeed + 5
                                task.wait(0.4*animslowdownmult)
                                pcall(function()
                                    findthing("LeftLegWeld", character):Destroy()
                                end)
                                pcall(function()
                                    findthing("RightLegWeld", character):Destroy()
                                end)
                                task.wait(1.4*animslowdownmult)
                                lastparrytick = tick()
                                charhum.WalkSpeed = charhum.WalkSpeed + 11
                                charhum.JumpHeight = charhum.JumpHeight + 7.2
                                donot:Destroy()
                                state = "idle"
                            end
                        end
                    end
                end)
                --just send ur backup tick to the function and it should work fineeeee
                tool.Activated:Connect(function()
                    if state == "idle" and not charhum.PlatformStand then
                        state = "swinging"
                        local donot = Instance.new("BoolValue", charhum)
                        donot.Name = "dontchangews"
                        for i,v in pairs(hitpeople) do
                            hitpeople[i] = nil
                        end
                        local backuptick = equip
            -- =========================
-- COMPLEMENTO: ANULAR TODOS OS SONS
-- =========================

local function muteSound(s)
	if typeof(s) == "Instance" and s:IsA("Sound") then
		s.Volume = 0
		s:Stop()
		s.PlayOnRemove = false
	end
end

-- tenta anular sons declarados em variáveis
pcall(function()
	muteSound(swishsound)
	muteSound(blocksound)
	muteSound(punchsound)
	muteSound(kicksound)
	muteSound(goresound)
	muteSound(basssound)
end)

-- anula QUALQUER Sound que tente tocar no Tool ou descendentes
for _,obj in ipairs(tool:GetDescendants()) do
	muteSound(obj)
end

tool.DescendantAdded:Connect(function(obj)
	muteSound(obj)
end)

-- segurança extra: se alguém chamar :Play()
game:GetService("RunService").Heartbeat:Connect(function()
	for _,obj in ipairs(tool:GetDescendants()) do
		if obj:IsA("Sound") and obj.Playing then
			obj:Stop()
		end
	end
end)
