int numEm=230;
int numDay=7;
int numArea=3;
int numShift=2;

range Em=1..numEm;
range Day=1..numDay;
range Area=1..numArea;
range Shift=1..numShift;

range Off=1..100;
range Fiday=101..150;
range Thday=151..190;
range Twday=191..230;

int TC=470;
int TT=670;
int TF=1070;
int K[Area][Day]=...;
int SD[Area][Day]=...;
int SN[Area][Day]=...;
dvar boolean XD[Em][Day][Area];//whether employee [e] is assigned on Day shift [d] in Area [k]
dvar boolean XN[Em][Day][Area];//whether employee [e] is assigned on Night shift [d] in Area [k]
dvar boolean A[Em][Shift][Area];//whether employee is assigned for Shift [s] in Area [k]
dvar boolean X[Em];//whether employee [e] is used
float temp;
execute{
var before = new Date();
temp = before.getTime();
}
execute SETTING{
	 cplex.tilim=5000;
}
//objective function
minimize sum(e in Twday)TC*X[e] + sum(e in Thday)TT*X[e] + sum(e in Fiday)TF*X[e];

subject to
{
//Constraint (1) & (2): satisfy the requirement of employee 
forall(d in Day, k in Area){
	sum(e in Off)K[k][d]*XD[e][d][k]+sum(e in Fiday)0.8*K[k][d]*XD[e][d][k]+sum(e in Thday)0.75*K[k][d]*XD[e][d][k]+sum(e in Twday)0.7*K[k][d]*XD[e][d][k]>=SD[k][d];
	sum(e in Off)K[k][d]*XN[e][d][k]+sum(e in Fiday)0.8*K[k][d]*XN[e][d][k]+sum(e in Thday)0.75*K[k][d]*XN[e][d][k]+sum(e in Twday)0.7*K[k][d]*XN[e][d][k]>=SN[k][d];
}

//Contraint (3),(4) & (5): each employee work in fixed area on either day shift or night shift
forall(e in Em,d in Day,k in Area){	
	A[e][1][k]>=XD[e][d][k];
	A[e][2][k]>=XN[e][d][k];
}
forall(e in Em){
	sum(s in Shift,k in Area)A[e][s][k]==X[e];
}

//Constraints (6) & (7): each area has at least 10 official workers
forall(d in Day){
  sum(e in Off,k in Area)XD[e][d][k]>=10;
  sum(e in Off,k in Area)XN[e][d][k]>=10;
}

//Constraint (8): each Temp employee on 2days contract must work exactly 2 days
forall(e in Twday){
	sum(d in Day,k in Area)XD[e][d][k]+sum(d in Day,k in Area)XN[e][d][k]==2*X[e];
}	

//Constraint (9): each Temp employee on 3days contract must work exactly 3 days
forall(e in Thday){
	sum(d in Day,k in Area)XD[e][d][k]+sum(d in Day,k in Area)XN[e][d][k]==3*X[e];
}

//Constraint (10): each Temp employee on 5days contract must work exactly 5 days
forall(e in Fiday){
	sum(d in Day,k in Area)XD[e][d][k]+sum(d in Day,k in Area)XN[e][d][k]==5*X[e];
}

//Constraint (11): each official employee has 1 day off
forall(e in Off){
	sum(d in Day,k in Area)XD[e][d][k]+sum(d in Day,k in Area)XN[e][d][k]==6*X[e];
}

//Constraints (12), (13), and (14): define X[e]=1
forall(e in Em,d in Day,k in Area){
	X[e]>=XD[e][d][k];
	X[e]>=XN[e][d][k];
}
forall(e in Em){
	sum(d in Day,k in Area)XD[e][d][k]+sum(d in Day,k in Area)XN[e][d][k]>=X[e];
}

}
execute{
var after = new Date();
writeln("solving time ~= ",after.getTime()-temp);
}
