<?php

namespace App\Model\Api\Bgg;

class BggApi {
    public function getRating(int $bggId): float {
        $url = "https://boardgamegeek.com/xmlapi2/thing?id={$bggId}&stats=1";
        $xml = simplexml_load_file($url);
        if ($xml === false) {
            throw new \Exception('Failed to fetch data from BGG API');
        }
        return (float)$xml->item->statistics->ratings->average->attributes()->value;
    }
}