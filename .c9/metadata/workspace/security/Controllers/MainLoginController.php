{"filter":false,"title":"MainLoginController.php","tooltip":"/security/Controllers/MainLoginController.php","undoManager":{"mark":52,"position":52,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":77,"column":1},"action":"insert","lines":["<?php","","namespace security\\Models\\Login;","","use \\security\\Models\\Authenticate;","","use \\security\\Models\\ErrorRunner;","","use \\security\\Models\\PDOSingleton;","","$errors = array();","","$auth = new Authenticate();","","// Error suppressor not normally needed, ","$email = $auth->filledAndSet(@$_POST['email']) ? $auth->vEmail($_POST['email']) : null;","$password = $auth->filledAndSet(@$_POST['password']) ? $_POST['password'] : null","","if (!$email || !$password) {","    $email || $errors[] = \"No email was sent over.\";","    $password || $errors[] = \"No password was sent over.\";","    $errors[] = \"A required field was missing.\";","}","","class Login ","{","    private $_email;","    private $_password;","    private $_pdo;","    private $_errors = [];","","    public function __construct($email, $password, \\PDO $pdo)","    {","        $this->_email = $email;","        $this->_password = $password;","        $this->_pdo = $pdo;","        $this->checkUser();","    }","    protected function checkUser()","    {","        $pdo = $this->pdo;","        $sql = 'SELECT email, password FROM customers WHERE email = :email';","        $stmt = $sql->prepare($sql);","        $stmt->bindParam(':email', $this->_email, PDO::PARAM_STR);","        $stmt->execute();","        $errorInfo = $stmt->errorInfo();","        if (isset($errorInfo[2])) {","            $this->_errors[] = $errorInfo[2];","        }","        // Mysql returns the number of results fetched as an integer, but SQLite does not.","        // This check makes the code more portable.","        $row = $stmt->fetch();","        if (!$row) {","            $this->_errors[] = \"No user could be found.\";","        }","        if ($row) {","            $result = $stmt->bindColumn('password', $resultPassword);","            $isCorrectPassword = password_verify($this->_password, $resultPassword);","            if ($isCorrectPassword) {","                return true;","            }","            if (!$isCorrectPassword) {","                $this->_errors[] = \"Invalid password\";","            }","        }","    }","    ","}","","if (empty($errors)) {","    $pdo = new PDOSingleton();","    new Login($email, $password, $pdo);","}","","if (!empty($errors)) {","    $err = new ErrorRunner();","    $err->runErrors($errors);","}"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":0},"end":{"row":3,"column":0},"action":"remove","lines":["namespace security\\Models\\Login;",""]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":0},"end":{"row":3,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":22,"column":0},"end":{"row":65,"column":1},"action":"remove","lines":["class Login ","{","    private $_email;","    private $_password;","    private $_pdo;","    private $_errors = [];","","    public function __construct($email, $password, \\PDO $pdo)","    {","        $this->_email = $email;","        $this->_password = $password;","        $this->_pdo = $pdo;","        $this->checkUser();","    }","    protected function checkUser()","    {","        $pdo = $this->pdo;","        $sql = 'SELECT email, password FROM customers WHERE email = :email';","        $stmt = $sql->prepare($sql);","        $stmt->bindParam(':email', $this->_email, PDO::PARAM_STR);","        $stmt->execute();","        $errorInfo = $stmt->errorInfo();","        if (isset($errorInfo[2])) {","            $this->_errors[] = $errorInfo[2];","        }","        // Mysql returns the number of results fetched as an integer, but SQLite does not.","        // This check makes the code more portable.","        $row = $stmt->fetch();","        if (!$row) {","            $this->_errors[] = \"No user could be found.\";","        }","        if ($row) {","            $result = $stmt->bindColumn('password', $resultPassword);","            $isCorrectPassword = password_verify($this->_password, $resultPassword);","            if ($isCorrectPassword) {","                return true;","            }","            if (!$isCorrectPassword) {","                $this->_errors[] = \"Invalid password\";","            }","        }","    }","    ","}"]}]}],[{"group":"doc","deltas":[{"start":{"row":21,"column":0},"end":{"row":22,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":21,"column":0},"end":{"row":22,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":34},"end":{"row":7,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":7,"column":0},"end":{"row":8,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":0},"end":{"row":8,"column":1},"action":"insert","lines":["u"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":1},"end":{"row":8,"column":2},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":2},"end":{"row":8,"column":3},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":3},"end":{"row":8,"column":4},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":4},"end":{"row":8,"column":5},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":5},"end":{"row":8,"column":6},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":5},"end":{"row":8,"column":6},"action":"remove","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":5},"end":{"row":8,"column":6},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":6},"end":{"row":8,"column":7},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":7},"end":{"row":8,"column":8},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":8},"end":{"row":8,"column":9},"action":"insert","lines":["u"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":9},"end":{"row":8,"column":10},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":10},"end":{"row":8,"column":11},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":11},"end":{"row":8,"column":12},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":12},"end":{"row":8,"column":13},"action":"insert","lines":["y"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":13},"end":{"row":8,"column":14},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":14},"end":{"row":8,"column":15},"action":"insert","lines":["M"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":15},"end":{"row":8,"column":16},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":16},"end":{"row":8,"column":17},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":17},"end":{"row":8,"column":18},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":18},"end":{"row":8,"column":19},"action":"insert","lines":["l"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":19},"end":{"row":8,"column":20},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":20},"end":{"row":8,"column":21},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":21},"end":{"row":8,"column":22},"action":"insert","lines":["L"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":22},"end":{"row":8,"column":23},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":23},"end":{"row":8,"column":24},"action":"insert","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":24},"end":{"row":8,"column":25},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":25},"end":{"row":8,"column":26},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":26},"end":{"row":8,"column":27},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":27},"end":{"row":8,"column":28},"action":"insert","lines":["M"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":28},"end":{"row":8,"column":29},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":29},"end":{"row":8,"column":30},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":30},"end":{"row":8,"column":31},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":31},"end":{"row":8,"column":32},"action":"insert","lines":["L"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":32},"end":{"row":8,"column":33},"action":"insert","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":32},"end":{"row":8,"column":33},"action":"remove","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":32},"end":{"row":8,"column":33},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":33},"end":{"row":8,"column":34},"action":"insert","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":34},"end":{"row":8,"column":35},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":35},"end":{"row":8,"column":36},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":36},"end":{"row":8,"column":37},"action":"insert","lines":["."]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":37},"end":{"row":8,"column":38},"action":"insert","lines":["p"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":38},"end":{"row":8,"column":39},"action":"insert","lines":["h"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":39},"end":{"row":8,"column":40},"action":"insert","lines":["p"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":40},"end":{"row":8,"column":41},"action":"insert","lines":[";"]}]}]]},"ace":{"folds":[],"scrolltop":420,"scrollleft":0,"selection":{"start":{"row":8,"column":41},"end":{"row":8,"column":41},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":17,"state":"php-start","mode":"ace/mode/php"}},"timestamp":1417584903230,"hash":"e81a074a264a7c955d5b12954167861f9b6635b9"}