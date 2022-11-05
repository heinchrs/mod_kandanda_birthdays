<?php

/**
 * @package    KandandaBirthdays
 * @author     Heinl Christian <heinchrs@gmail.com>
 * @copyright  (C) 2015-2021 Heinl Christian
 * @license    GNU General Public License version 2 or later
 */

// -- No direct access
defined('_JEXEC') or die;
?>


<!-- Beginn Kandanda Birthdays -->
<div id="kandanda_birthdays_container">
<?php
if (count($data) > 0)
{
	foreach ($data as $entry)
	{
?>
	<div class="birthday_entry">
		<span class="birthday_name"><?php echo $entry['title']; ?></span>
		<span class="birthday_date"><?php echo $entry['value']; ?> (<?php echo $entry['wird_x_jahre']; ?>)</span>
	</div>
<?php
	};
}
else
{
	echo '<div class="no_data">' . JText::_('MOD_KANDANDA_BIRTHDAYS_NO_BIRTHDAYS') . '</div>';
}
?>
</div>
<!-- Ende Kandanda Birthdays -->
