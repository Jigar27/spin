bool flag0, flag1;
bool turn;

ltl mutex { [] !(p0@crit0 && p1@crit1) }
ltl strongprogress1 {[](flag1 -> (flag1 U p1@crit1)) }
ltl strongprogress0 {[](flag0 -> (flag0 U p0@crit0)) }
ltl infcrit0 {[]<> p0@crit0} /* fairness assumption is required */
ltl infcrit1 {[]<> p1@crit1} /* fairness assumption is required */

active proctype p0()
{
try0: flag0 = true;
      turn = 1;

      !((flag1 == true) && (turn == 1))

      /* p0 enters the critical section */
crit0:
      /* p0 exits the critical section */

      flag0 = false;
      goto try0;
}

active proctype p1()
{
try1: flag1 = true;
      turn = 0;

      !((flag0 == true) && (turn == 0))

      /* p1 enters the critical section */
crit1:
      /* p1 exits the critical section */

      flag1 = false;
      goto try1;
}
