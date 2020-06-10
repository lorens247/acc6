<?php namespace GeneaLabs\LaravelModelCaching;

use GeneaLabs\LaravelModelCaching\Traits\BuilderCaching;
use GeneaLabs\LaravelModelCaching\Traits\Buildable;
use GeneaLabs\LaravelModelCaching\Traits\Caching;
use Illuminate\Database\Eloquent\Builder as EloquentBuilder;

class CachedBuilder extends EloquentBuilder
{
    use Buildable;
    use BuilderCaching;
    use Caching;
}
