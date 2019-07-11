a =1; %worksheet
StimLevels = [3 4 5 6 7 8 9 10 11];

%% Stim1

V5_s1_stim1prime1 = xlsread('SummaryV5',a,'C3:K3');
V5_s1_stim1prime2 = xlsread('SummaryV5',a,'C4:K4');
V5_s1_stim1prime3 = xlsread('SummaryV5',a,'C5:K5');

V5_s2_stim1prime1 = xlsread('SummaryV5',a,'C6:K6');
V5_s2_stim1prime2 = xlsread('SummaryV5',a,'C7:K7');
V5_s2_stim1prime3 = xlsread('SummaryV5',a,'C8:K8');

V5_s3_stim1prime1 = xlsread('SummaryV5',a,'C9:K9');
V5_s3_stim1prime2 = xlsread('SummaryV5',a,'C10:K10');
V5_s3_stim1prime3 = xlsread('SummaryV5',a,'C11:K11');

V5_s4_stim1prime1 = xlsread('SummaryV5',a,'C12:K12');
V5_s4_stim1prime2 = xlsread('SummaryV5',a,'C13:K13');
V5_s4_stim1prime3 = xlsread('SummaryV5',a,'C14:K14');

V5_s6_stim1prime1 = xlsread('SummaryV5',a,'C15:K15');
V5_s6_stim1prime2 = xlsread('SummaryV5',a,'C16:K16');
V5_s6_stim1prime3 = xlsread('SummaryV5',a,'C17:K17');

V5_s7_stim1prime1 = xlsread('SummaryV5',a,'C18:K18');
V5_s7_stim1prime2 = xlsread('SummaryV5',a,'C19:K19');
V5_s7_stim1prime3 = xlsread('SummaryV5',a,'C20:K20');

V5_s8_stim1prime1 = xlsread('SummaryV5',a,'C21:K21');
V5_s8_stim1prime2 = xlsread('SummaryV5',a,'C22:K22');
V5_s8_stim1prime3 = xlsread('SummaryV5',a,'C23:K23');

V5_s9_stim1prime1 = xlsread('SummaryV5',a,'C24:K24');
V5_s9_stim1prime2 = xlsread('SummaryV5',a,'C25:K25');
V5_s9_stim1prime3 = xlsread('SummaryV5',a,'C26:K26');

V5_s10_stim1prime1 = xlsread('SummaryV5',a,'C27:K27');
V5_s10_stim1prime2 = xlsread('SummaryV5',a,'C28:K28');
V5_s10_stim1prime3 = xlsread('SummaryV5',a,'C29:K29');

V5_s11_stim1prime1 = xlsread('SummaryV5',a,'C30:K30');
V5_s11_stim1prime2 = xlsread('SummaryV5',a,'C31:K31');
V5_s11_stim1prime3 = xlsread('SummaryV5',a,'C32:K32');

V5_s12_stim1prime1 = xlsread('SummaryV5',a,'C33:K33');
V5_s12_stim1prime2 = xlsread('SummaryV5',a,'C34:K34');
V5_s12_stim1prime3 = xlsread('SummaryV5',a,'C35:K35');

V5_s13_stim1prime1 = xlsread('SummaryV5',a,'C36:K36');
V5_s13_stim1prime2 = xlsread('SummaryV5',a,'C37:K37');
V5_s13_stim1prime3 = xlsread('SummaryV5',a,'C38:K38');

V5_s14_stim1prime1 = xlsread('SummaryV5',a,'C39:K39');
V5_s14_stim1prime2 = xlsread('SummaryV5',a,'C40:K40');
V5_s14_stim1prime3 = xlsread('SummaryV5',a,'C41:K41');

V5_s16_stim1prime1 = xlsread('SummaryV5',a,'C42:K42');
V5_s16_stim1prime2 = xlsread('SummaryV5',a,'C43:K43');
V5_s16_stim1prime3 = xlsread('SummaryV5',a,'C44:K44');

V5_s17_stim1prime1 = xlsread('SummaryV5',a,'C45:K45');
V5_s17_stim1prime2 = xlsread('SummaryV5',a,'C46:K46');
V5_s17_stim1prime3 = xlsread('SummaryV5',a,'C47:K47');

V5_s18_stim1prime1 = xlsread('SummaryV5',a,'C48:K48');
V5_s18_stim1prime2 = xlsread('SummaryV5',a,'C49:K49');
V5_s18_stim1prime3 = xlsread('SummaryV5',a,'C50:K50');

V5_s19_stim1prime1 = xlsread('SummaryV5',a,'C51:K51');
V5_s19_stim1prime2 = xlsread('SummaryV5',a,'C52:K52');
V5_s19_stim1prime3 = xlsread('SummaryV5',a,'C53:K53');

V5_s20_stim1prime1 = xlsread('SummaryV5',a,'C54:K54');
V5_s20_stim1prime2 = xlsread('SummaryV5',a,'C55:K55');
V5_s20_stim1prime3 = xlsread('SummaryV5',a,'C56:K56');

V5_s21_stim1prime1 = xlsread('SummaryV5',a,'C57:K57');
V5_s21_stim1prime2 = xlsread('SummaryV5',a,'C58:K58');
V5_s21_stim1prime3 = xlsread('SummaryV5',a,'C59:K59');

V5_s22_stim1prime1 = xlsread('SummaryV5',a,'C60:K60');
V5_s22_stim1prime2 = xlsread('SummaryV5',a,'C61:K61');
V5_s22_stim1prime3 = xlsread('SummaryV5',a,'C62:K62');

V5_s23_stim1prime1 = xlsread('SummaryV5',a,'C63:K63');
V5_s23_stim1prime2 = xlsread('SummaryV5',a,'C64:K64');
V5_s23_stim1prime3 = xlsread('SummaryV5',a,'C65:K65');

V5_s24_stim1prime1 = xlsread('SummaryV5',a,'C66:K66');
V5_s24_stim1prime2 = xlsread('SummaryV5',a,'C67:K67');
V5_s24_stim1prime3 = xlsread('SummaryV5',a,'C68:K68');

% Stim 2

V5_s1_stim2prime1 = xlsread('SummaryV5',a,'O3:W3');
V5_s1_stim2prime2 = xlsread('SummaryV5',a,'O4:W4');
V5_s1_stim2prime3 = xlsread('SummaryV5',a,'O5:W5');

V5_s2_stim2prime1 = xlsread('SummaryV5',a,'O6:W6');
V5_s2_stim2prime2 = xlsread('SummaryV5',a,'O7:W7');
V5_s2_stim2prime3 = xlsread('SummaryV5',a,'O8:W8');

V5_s3_stim2prime1 = xlsread('SummaryV5',a,'O9:W9');
V5_s3_stim2prime2 = xlsread('SummaryV5',a,'O10:W10');
V5_s3_stim2prime3 = xlsread('SummaryV5',a,'O11:W11');

V5_s4_stim2prime1 = xlsread('SummaryV5',a,'O12:W12');
V5_s4_stim2prime2 = xlsread('SummaryV5',a,'O13:W13');
V5_s4_stim2prime3 = xlsread('SummaryV5',a,'O14:W14');

V5_s6_stim2prime1 = xlsread('SummaryV5',a,'O15:W15');
V5_s6_stim2prime2 = xlsread('SummaryV5',a,'O16:W16');
V5_s6_stim2prime3 = xlsread('SummaryV5',a,'O17:W17');

V5_s7_stim2prime1 = xlsread('SummaryV5',a,'O18:W18');
V5_s7_stim2prime2 = xlsread('SummaryV5',a,'O19:W19');
V5_s7_stim2prime3 = xlsread('SummaryV5',a,'O20:W20');

V5_s8_stim2prime1 = xlsread('SummaryV5',a,'O21:W21');
V5_s8_stim2prime2 = xlsread('SummaryV5',a,'O22:W22');
V5_s8_stim2prime3 = xlsread('SummaryV5',a,'O23:W23');

V5_s9_stim2prime1 = xlsread('SummaryV5',a,'O24:W24');
V5_s9_stim2prime2 = xlsread('SummaryV5',a,'O25:W25');
V5_s9_stim2prime3 = xlsread('SummaryV5',a,'O26:W26');

V5_s10_stim2prime1 = xlsread('SummaryV5',a,'O27:W27');
V5_s10_stim2prime2 = xlsread('SummaryV5',a,'O28:W28');
V5_s10_stim2prime3 = xlsread('SummaryV5',a,'O29:W29');

V5_s11_stim2prime1 = xlsread('SummaryV5',a,'O30:W30');
V5_s11_stim2prime2 = xlsread('SummaryV5',a,'O31:W31');
V5_s11_stim2prime3 = xlsread('SummaryV5',a,'O32:W32');

V5_s12_stim2prime1 = xlsread('SummaryV5',a,'O33:W33');
V5_s12_stim2prime2 = xlsread('SummaryV5',a,'O34:W34');
V5_s12_stim2prime3 = xlsread('SummaryV5',a,'O35:W35');

V5_s13_stim2prime1 = xlsread('SummaryV5',a,'O36:W36');
V5_s13_stim2prime2 = xlsread('SummaryV5',a,'O37:W37');
V5_s13_stim2prime3 = xlsread('SummaryV5',a,'O38:W38');

V5_s14_stim2prime1 = xlsread('SummaryV5',a,'O39:W39');
V5_s14_stim2prime2 = xlsread('SummaryV5',a,'O40:W40');
V5_s14_stim2prime3 = xlsread('SummaryV5',a,'O41:W41');

V5_s16_stim2prime1 = xlsread('SummaryV5',a,'O42:W42');
V5_s16_stim2prime2 = xlsread('SummaryV5',a,'O43:W43');
V5_s16_stim2prime3 = xlsread('SummaryV5',a,'O44:W44');

V5_s17_stim2prime1 = xlsread('SummaryV5',a,'O45:W45');
V5_s17_stim2prime2 = xlsread('SummaryV5',a,'O46:W46');
V5_s17_stim2prime3 = xlsread('SummaryV5',a,'O47:W47');

V5_s18_stim2prime1 = xlsread('SummaryV5',a,'O48:W48');
V5_s18_stim2prime2 = xlsread('SummaryV5',a,'O49:W49');
V5_s18_stim2prime3 = xlsread('SummaryV5',a,'O50:W50');

V5_s19_stim2prime1 = xlsread('SummaryV5',a,'O51:W51');
V5_s19_stim2prime2 = xlsread('SummaryV5',a,'O52:W52');
V5_s19_stim2prime3 = xlsread('SummaryV5',a,'O53:W53');

V5_s20_stim2prime1 = xlsread('SummaryV5',a,'O54:W54');
V5_s20_stim2prime2 = xlsread('SummaryV5',a,'O55:W55');
V5_s20_stim2prime3 = xlsread('SummaryV5',a,'O56:W56');

V5_s21_stim2prime1 = xlsread('SummaryV5',a,'O57:W57');
V5_s21_stim2prime2 = xlsread('SummaryV5',a,'O58:W58');
V5_s21_stim2prime3 = xlsread('SummaryV5',a,'O59:W59');

V5_s22_stim2prime1 = xlsread('SummaryV5',a,'O60:W60');
V5_s22_stim2prime2 = xlsread('SummaryV5',a,'O61:W61');
V5_s22_stim2prime3 = xlsread('SummaryV5',a,'O62:W62');

V5_s23_stim2prime1 = xlsread('SummaryV5',a,'O63:W63');
V5_s23_stim2prime2 = xlsread('SummaryV5',a,'O64:W64');
V5_s23_stim2prime3 = xlsread('SummaryV5',a,'O65:W65');

V5_s24_stim2prime1 = xlsread('SummaryV5',a,'O66:W66');
V5_s24_stim2prime2 = xlsread('SummaryV5',a,'O67:W67');
V5_s24_stim2prime3 = xlsread('SummaryV5',a,'O68:W68');

save('AccuraciesV5')