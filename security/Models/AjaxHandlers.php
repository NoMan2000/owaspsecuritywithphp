<?php

namespace security\Models;

class AjaxHandlers
{
    public function __construct()
    {
        
    }
    
    public function getHashtags($string, $str = 1)
    {
        preg_match_all('/#(\w+)/', $string, $matches);
        $i = 0;
        if ($str) {
            foreach ($matches[1] as $match) {
                $count = count($matches[1]);
                $keywords .= "$match";
                $i++;
                if ($count > $i) {
                    $keywords .= ", ";
                }
            }
        }
        if (!$str) {
            foreach ($matches[1] as $match) {
                $keyword[] = $match;
            }
            $keywords = $keyword;
        }
        return $keywords;
    }
    
    public function removeHashtags($string)
    {
        return preg_replace('/#(?=[\w-]+)/', '', preg_replace('/(?:#[\w-]+\s*)+$/', '', $string));
    }
}