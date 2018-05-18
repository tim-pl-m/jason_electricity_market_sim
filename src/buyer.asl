// Agent buyer in project electricity_market.mas2j

/* Initial beliefs and rules */
energy_needed(10).

/* Initial goals */
!buys.
/* Plans */
+!buys
	: energy_needed(E) & E > 0 
	<- 	.print("I need ",E," amount of energy");
        .print("Requesting energy from manager ", network_manager);
		.send(network_manager,tell,buying(E)).

+bought(E_bought) 
	: energy_needed(E) 
	<- .print("I bought ", E_bought," amount of energy");
		+energy_needed(E - E_bought).
