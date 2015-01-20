{"filter":false,"title":"CustomersJson.php","tooltip":"/security/Models/DTClasses/CustomersJson.php","undoManager":{"mark":31,"position":31,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":47,"column":1},"action":"insert","lines":["<?php","namespace cellControl\\DTClasses;","if (PHP_OS === \"WINNT\" ) {","    ini_set('error_reporting', E_ALL);","    ini_set(\"display_errors\", 1);","    ini_set(\"display_startup_errors\", 1);","}","require_once(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . \"init.php\");","class GroupsJson extends DataTablesExtension","{","    public function __construct($file = 'devices-json.php')","    {","        parent::__construct($file);","    }","    protected function setSelectorFields()","    {","        $userid = $this->userid;","        $this->checkPermissionLevel();","        if (!$this->getDevicesPermissions()) {","            $this->errors[] = \"No permissions on device.\";","            $this->outputErrors();","        }","        $this->checkSession();","        // There seems to be absolutely no purpose to setting the entityID in this.","        // $this->setUserEntity();","        $this->setSelectorsString('id, name, address, city, state, zip, type');","        $this->table = 'site';","        $this->setMasterSlaveQuery(\"SELECT DISTINCT us.site_id FROM usertosite us WHERE us.user_id = {$userid}\");","        $this->setOrderAndSearch();","        $this->performQueries();","    }","    protected function changeOrderField()","    {","        return 'user_name';","    }","    protected function setSQuery()","    {","        $selectorsString = $this->getSelectorsString();","        $table = $this->table;","        $fullSiteList = $this->getFullSiteList();","        $where = $this->getWhereClause();","        $order = $this->getOrder();","        $limit = $this->getLimit();","        $this->sQuery = \"SELECT SQL_CALC_FOUND_ROWS $selectorsString","                   FROM $table WHERE","                   id IN ($fullSiteList) $where $order $limit\";","    }","}"]}]}],[{"group":"doc","deltas":[{"start":{"row":16,"column":8},"end":{"row":16,"column":32},"action":"remove","lines":["$userid = $this->userid;"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":32},"end":{"row":10,"column":58},"action":"remove","lines":["$file = 'devices-json.php'"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":0},"end":{"row":13,"column":5},"action":"remove","lines":["    public function __construct()","    {","        parent::__construct($file);","    }"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":0},"end":{"row":11,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":12,"column":0},"end":{"row":20,"column":34},"action":"remove","lines":["        ","        $this->checkPermissionLevel();","        if (!$this->getDevicesPermissions()) {","            $this->errors[] = \"No permissions on device.\";","            $this->outputErrors();","        }","        $this->checkSession();","        // There seems to be absolutely no purpose to setting the entityID in this.","        // $this->setUserEntity();"]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":35},"end":{"row":13,"column":76},"action":"remove","lines":["id, name, address, city, state, zip, type"]},{"start":{"row":13,"column":35},"end":{"row":13,"column":61},"action":"insert","lines":["id, fulfilled, unfulfilled"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":0},"end":{"row":16,"column":0},"action":"remove","lines":["        $this->setMasterSlaveQuery(\"SELECT DISTINCT us.site_id FROM usertosite us WHERE us.user_id = {$userid}\");",""]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":24},"end":{"row":14,"column":28},"action":"remove","lines":["site"]},{"start":{"row":14,"column":24},"end":{"row":14,"column":25},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":25},"end":{"row":14,"column":26},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":26},"end":{"row":14,"column":27},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":27},"end":{"row":14,"column":28},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":28},"end":{"row":14,"column":29},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":29},"end":{"row":14,"column":30},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":0},"end":{"row":22,"column":0},"action":"remove","lines":["    protected function changeOrderField()","    {","        return 'user_name';","    }",""]}]}],[{"group":"doc","deltas":[{"start":{"row":22,"column":8},"end":{"row":23,"column":8},"action":"remove","lines":["$fullSiteList = $this->getFullSiteList();","        "]}]}],[{"group":"doc","deltas":[{"start":{"row":26,"column":31},"end":{"row":27,"column":41},"action":"remove","lines":["WHERE","                   id IN ($fullSiteList) "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":5},"end":{"row":12,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":25},"end":{"row":8,"column":44},"action":"remove","lines":["DataTablesExtension"]},{"start":{"row":8,"column":25},"end":{"row":8,"column":26},"action":"insert","lines":["B"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":26},"end":{"row":8,"column":27},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":27},"end":{"row":8,"column":28},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":28},"end":{"row":8,"column":29},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":25},"end":{"row":8,"column":29},"action":"remove","lines":["Base"]},{"start":{"row":8,"column":25},"end":{"row":8,"column":39},"action":"insert","lines":["BaseDataTables"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":6},"end":{"row":8,"column":12},"action":"remove","lines":["Groups"]},{"start":{"row":8,"column":6},"end":{"row":8,"column":7},"action":"insert","lines":["C"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":7},"end":{"row":8,"column":8},"action":"insert","lines":["u"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":8},"end":{"row":8,"column":9},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":9},"end":{"row":8,"column":10},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":10},"end":{"row":8,"column":11},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":11},"end":{"row":8,"column":12},"action":"insert","lines":["m"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":12},"end":{"row":8,"column":13},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":13},"end":{"row":8,"column":14},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":14},"end":{"row":8,"column":15},"action":"insert","lines":["s"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":26,"column":5},"end":{"row":26,"column":5},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":57,"mode":"ace/mode/php"}},"timestamp":1418517663758,"hash":"b04074493240c6185b9a2d5f3f972093de901107"}