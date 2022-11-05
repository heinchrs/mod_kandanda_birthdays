<?php

/**
 * @package KandandaBirthdays
 * @author  Heinl Christian <heinchrs@gmail.com>
 * @copyright  (C) 2015-2020 Heinl Christian
 * @license GNU General Public License version 2 or later
 */


// -- No direct access
defined('_JEXEC') or die;

// Prüfen ob Komponente Kandanda installiert ist
if (JComponentHelper::isEnabled('com_kandanda', true))
{
	// Include the helper-php
	require_once dirname(__FILE__) . DS . 'helper.php';

	// Get data
	$data = KandandaBirthdays::getBirthdays($params);

	// Show formular data
	require JModuleHelper::getLayoutPath('mod_kandanda_birthdays');

	// Include CSS
	if ($params->get('load_css') == 1)
	{
		JHTML::stylesheet('mod_kandanda_birthdays.css', 'media/mod_kandanda_birthdays/css/');
	}
}
else
{
	// Report error
	echo 'Komponente Kandanda konnte nicht gefunden werden';
}
