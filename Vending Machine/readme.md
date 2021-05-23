# Final State Machine (FSM) - Vending Machine using VHDL
 
**Vending Machine that sells soda cans that costs a 2$ each and using 3 types of coins: 1$, 2$ and 5$.**

**Objective:** To design a state machine that determines when to dispense a can, how to return the change.

*Assume that only one action could be made in every “clock cycle” or state.*

**Rule:** First give back the change then dispense the can

#### Understanding the possibilities :
1. Entering no money
2. Entering 1$ followed by another 1$ => getting the can
3. Entering 1$ followed by 2$ => receiving  change => getting a can
4. Entering 1$ followed by 5$ => receiving  change => getting a can
5. Entering 2$ and getting the can
6. Entering 5$ => receiving change => getting a can.


#### FSM diagrame:

**Note: 0$ = “00”, 1$ = “01”, 2$=”10″, 5$ = “11”**

![Alt Text](https://thunderwiring.files.wordpress.com/2014/05/fsmdiagram.png)
