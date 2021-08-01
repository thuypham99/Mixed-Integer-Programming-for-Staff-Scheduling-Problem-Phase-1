- 👋 Hi, I’m @thuypham99
- 👀 This is the thesis topic for the Degree of Bachelor of Engineering in Logistics and Supply Chain Management
- 📫 How to reach me: phamtranminhthuy@gmail.com

✨ METAHEURISTIC FOR STAFF SCHEDULING PROBLEM IN ORDER FULFILLMENT: A CASE STUDY OF LAZADA ELOGISTICS VIETNAM ✨

✨ Objectives of Study: 

The solution of the scheduling model in this study will help not only Lazada E-Logistics Express but also other e-commerce platforms which have its order fulfillment service launch its outbound sales plan. When a vast majority of customer orders occurs, the outbound operation needs to work in full capacity. The rostering team needs some support tools to assign both temporary and official staff effectively in each area. Therefore, utilizing this rostering implementation in sales campaigns will help a company make the right decision at the right time to hire employees with affordable costs whilst satisfying worker preferences. These tools also can help managers reduce a bottleneck caused by improper assignment. Simultaneously, building a transparent contract including legal regulations, workplace policies, penalty, fixed labor cost, bonus cost, and other conditions not only ensure the rights and duties of employees but also help a warehouse avoid a sudden withdrawal.

✨ Scope:

The use of scheduling methods is crucial in building an effective real-world staff scheduling problem. This paper is aimed at solving a problem domain from order fulfillment industry, which plays a key vital to satisfy such a sudden increase of customer satisfactions, especially in Covid-19 pandemic by and large. There are two main objective functions including minimize the hiring cost and maximize the aspirations of workers. 

In this research, Requirement-Based Staff Scheduling Algorithm (RSSA) is introduced to compare with a two-phase Mixed Integer Programming and Genetic Algorithm with two-dimensional array chromosome structure. Mathematical model of phase 1 is implemented to give a fesible solution for the first target. Besides, experimental results highlight that RSSA and mathematical model of phase 2 could be applied effectively in current scale for the second goal. Especially, this novel algorithm tends to save more time whilst the Mixed Integer Programming model seems to satisfy high percentage of staff preferences when a demand forecasting is fluctuated. On the other hand, Genetic Algorithm is recommended in case of a scale of data is immense. 

------------- MODELLING FOR MATHEMATICAL MODEL PHASE 1 -------------

✨ Sets and Indices

ⅇ: Index of employees ⅇ=1…E (e ∈ Off/ e ∈ Temp/ e ∈Twday/ e ∈ Thday/ e ∈ Fiday)

d: Index of days d=1…D

k: Index of areas k=1…K

s: Index of shift s=1…S

TC: The payment for each two-day-contract temporary employee

TT: The payment for each three-day-contract temporary employee

TF: The payment for each five-day-contract temporary employee

✨ Parameters	

K[k][d]: KPI of official employee in area k on day d

SD[k][d]: Number of orders in area k for day shift d

SD[k][d]: Number of orders in area k for night shift d

✨ Decision Variables	

XD[e][d][k]: Binary variable; XD[e][d][k]=1 if employee ⅇ is assigned to day shift d in area k, otherwise XD[e][d][k]=0

XN[e][d][k]: Binary variable; XN[e][d][k]=1 if employee ⅇ is assigned to night shift d in area k, otherwise XN[e][d][k]=0

A[e][s][k]: Binary variable; A[e][s][k]=1 if employee ⅇ is assigned to shift s in area k, otherwise A[e][s][k]=0

X[e]: Binary variable; X[e]=1 if the employee  ⅇ is used, otherwise X[e]=0


The objective function focuses on minimizing the total cost of hiring temporary employees by analyzing the number of official and temporary workers needed for this scheduling horizon. 
Based on the defined workload of each employee, constraints (1) and (2) satisfy the forecasting number of required orders on day shift and night shift, respectively.
Constraint (3), (4), and (5) denote that if an employee is used, he must work in a constant working area on a fixed shift. 
Constraints (6) and (7) demonstrate the number of official employees that each area must have at least 10 workforces either day shift or night shift. 
Constraint (8) highlights that each temporary employee having a two-day contract must work exactly two working days. 
Accordingly, constraint (9) shows that a three-day-contract impermanent worker must be present precisely three working days. 
Similarly, constraint (10) assigns a legal condition of five-day-contract workforces. 
Constraint (11) defines the day-off interests of official employees. 
Constraints (12), (13), and (14) illustrate the condition in case the manpower is used then X_e equals 1.

<!---
thuypham99/thuypham99 is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
