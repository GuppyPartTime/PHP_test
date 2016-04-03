<?php
/**
 *
 * @author     	Kemal Sami KARACA
 * @description General settings
 *
 */

// GUPPY JOB BOARD APPLICATION version
define('GUPPY_JOBBOARD_VERSION', '1.0.0');

// Global settings definitions
foreach ($settings as $k => $setting)
{
	$k = strtoupper($k);
	define("{$k}", $setting);
}
?>
