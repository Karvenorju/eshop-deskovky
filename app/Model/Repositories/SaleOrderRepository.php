<?php

namespace App\Model\Repositories;

class SaleOrderRepository extends BaseRepository
{
    public function countOrdersToday(): int {
        return $this->connection
            ->select('COUNT(*)')
            ->from($this->getTable())
            ->where('DATE(created_at) = CURDATE()')  // Use raw SQL
            ->fetchSingle();
    }
}
