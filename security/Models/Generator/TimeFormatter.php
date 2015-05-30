<?php

namespace security\Models\Generator;

require_once dirname(dirname(__DIR__)) . '/public/init.php';

use \DateTimeZone;
use \DateTime;

class TimeFormatter
{
    // Code taken from http://stackoverflow.com/questions/1727077/generating-a-drop-down-list-of-timezones-with-php/17355238#17355238
    public function generateTimezoneList()
    {
        static $regions = [
            DateTimeZone::AFRICA,
            DateTimeZone::AMERICA,
            DateTimeZone::ANTARCTICA,
            DateTimeZone::ASIA,
            DateTimeZone::ATLANTIC,
            DateTimeZone::AUSTRALIA,
            DateTimeZone::EUROPE,
            DateTimeZone::INDIAN,
            DateTimeZone::PACIFIC,
        ];

        $timezones = array();
        foreach ($regions as $region) {
            $timezones = array_merge($timezones, DateTimeZone::listIdentifiers($region));
        }

        $timezone_offsets = array();
        foreach ($timezones as $timezone) {
            $tz = new DateTimeZone($timezone);
            $timezone_offsets[$timezone] = $tz->getOffset(new DateTime);
        }

        // sort timezone by offset
        asort($timezone_offsets);

        $timezone_list = array();
        foreach ($timezone_offsets as $timezone => $offset) {
            $offset_prefix = $offset < 0 ? '-' : '+';
            $offset_formatted = gmdate('H:i', abs($offset));
            $pretty_offset = "UTC{$offset_prefix}{$offset_formatted}";
            $timezone_list[$timezone] = "({$pretty_offset}) $timezone";
        }
        return $timezone_list;
    }
    public function isTimezone($key)
    {
        return key_exists($key, $this->generateTimezoneList());
    }

    public function offset($key)
    {
        $this->timezones = $this->generateTimezoneList();
        return $this->timezones[$key];
    }
}
