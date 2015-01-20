{"filter":false,"title":"DBPrivileges.php","tooltip":"/security/Interfaces/DBPrivileges.php","undoManager":{"mark":62,"position":62,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":1,"column":10},"action":"insert","lines":["const GLOBAL = 0;","    const "]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":1,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":0},"end":{"row":2,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":0},"end":{"row":3,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":11,"column":2},"action":"insert","lines":["<?php","","namespace security\\Interfaces;","","require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR. 'vendor/autoload.php');","","interface CustomerType ","{","    const CUSTOMER = 1;","    const CORPORATE = 2;","    const GROUP = 3; ","} "]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":0},"end":{"row":15,"column":10},"action":"remove","lines":["const GLOBAL = 0;","    const "]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":10},"end":{"row":8,"column":18},"action":"remove","lines":["CUSTOMER"]},{"start":{"row":8,"column":10},"end":{"row":8,"column":16},"action":"insert","lines":["GLOBAL"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":16},"end":{"row":8,"column":17},"action":"insert","lines":["U"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":17},"end":{"row":8,"column":18},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":18},"end":{"row":8,"column":19},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":19},"end":{"row":8,"column":20},"action":"insert","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":10},"end":{"row":9,"column":19},"action":"remove","lines":["CORPORATE"]},{"start":{"row":9,"column":10},"end":{"row":9,"column":11},"action":"insert","lines":["A"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":11},"end":{"row":9,"column":12},"action":"insert","lines":["D"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":12},"end":{"row":9,"column":13},"action":"insert","lines":["M"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":13},"end":{"row":9,"column":14},"action":"insert","lines":["I"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":14},"end":{"row":9,"column":15},"action":"insert","lines":["N"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":15},"end":{"row":9,"column":16},"action":"insert","lines":["U"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":16},"end":{"row":9,"column":17},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":17},"end":{"row":9,"column":18},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":18},"end":{"row":9,"column":19},"action":"insert","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":10},"end":{"row":10,"column":15},"action":"remove","lines":["GROUP"]},{"start":{"row":10,"column":10},"end":{"row":10,"column":11},"action":"insert","lines":["C"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":11},"end":{"row":10,"column":12},"action":"insert","lines":["O"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":12},"end":{"row":10,"column":13},"action":"insert","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":13},"end":{"row":10,"column":14},"action":"insert","lines":["P"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":14},"end":{"row":10,"column":15},"action":"insert","lines":["O"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":15},"end":{"row":10,"column":16},"action":"insert","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":16},"end":{"row":10,"column":17},"action":"insert","lines":["A"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":17},"end":{"row":10,"column":18},"action":"insert","lines":["T"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":18},"end":{"row":10,"column":19},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":19},"end":{"row":10,"column":20},"action":"insert","lines":["U"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":20},"end":{"row":10,"column":21},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":21},"end":{"row":10,"column":22},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":22},"end":{"row":10,"column":23},"action":"insert","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":10},"end":{"row":6,"column":23},"action":"remove","lines":["CustomerType "]},{"start":{"row":6,"column":10},"end":{"row":6,"column":11},"action":"insert","lines":["D"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":11},"end":{"row":6,"column":12},"action":"insert","lines":["B"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":12},"end":{"row":6,"column":13},"action":"insert","lines":["P"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":10},"end":{"row":6,"column":13},"action":"remove","lines":["DBP"]},{"start":{"row":6,"column":10},"end":{"row":6,"column":22},"action":"insert","lines":["DBPrivileges"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":28},"end":{"row":10,"column":29},"action":"remove","lines":[" "]},{"start":{"row":10,"column":28},"end":{"row":11,"column":0},"action":"insert","lines":["",""]},{"start":{"row":11,"column":0},"end":{"row":11,"column":4},"action":"insert","lines":["    "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":4},"end":{"row":11,"column":5},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":5},"end":{"row":11,"column":6},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":6},"end":{"row":11,"column":7},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":7},"end":{"row":11,"column":8},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":8},"end":{"row":11,"column":9},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":9},"end":{"row":11,"column":10},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":10},"end":{"row":11,"column":11},"action":"insert","lines":["C"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":11},"end":{"row":11,"column":12},"action":"insert","lines":["O"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":11},"end":{"row":11,"column":12},"action":"remove","lines":["O"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":11},"end":{"row":11,"column":12},"action":"insert","lines":["U"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["T"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["O"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["M"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":17},"end":{"row":11,"column":18},"action":"insert","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":18},"end":{"row":11,"column":19},"action":"insert","lines":["U"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":19},"end":{"row":11,"column":20},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":20},"end":{"row":11,"column":21},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":21},"end":{"row":11,"column":22},"action":"insert","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":22},"end":{"row":11,"column":23},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":23},"end":{"row":11,"column":24},"action":"insert","lines":["="]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":24},"end":{"row":11,"column":25},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":25},"end":{"row":11,"column":26},"action":"insert","lines":["4"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":26},"end":{"row":11,"column":27},"action":"insert","lines":[";"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":5,"column":0},"end":{"row":5,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1420600053690,"hash":"31639f09100bcc21ec29031f35cb448a6626e77e"}