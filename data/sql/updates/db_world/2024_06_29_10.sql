-- DB update 2024_06_29_09 -> 2024_06_29_10
-- Finding the Keymaster.
DELETE FROM `event_scripts` WHERE `id`=12857;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(12857, 0, 10, 19938, 10000, 0, 2248.43, 2227.97, 138.56, 2.48121),
(12857, 0, 9, 30029, 10, 0, 0, 0, 0, 0);

DELETE FROM `gameobject` WHERE (`id` = 184119 AND `guid` = 30029);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(30029, 184119, 530, 0, 0, 1, 1, 2248.23, 2228.12, 137.002, -2.14675, 0, 0, -0.878817, 0.47716, -1, 255, 1, '', 0, NULL);

DELETE FROM `creature_text` WHERE (`CreatureID` = 19938);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(19938, 0, 0, 'A flickering image of a female blood elf commander appears. From the surroundings, you can tell she must be inside Tempest Keep.', 16, 0, 100, 1, 0, 0, 17529, 0, 'Image of Commander Sarannis'),
(19938, 1, 0, 'The blood elf doesn\'t appear to be a magister, but perhaps she holds something that is the key to the tower\'s curse.', 16, 0, 100, 25, 0, 0, 17530, 0, 'Image of Commander Sarannis');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 19938;

DELETE FROM `smart_scripts` WHERE (`entryorguid` = 19938 AND `source_type` = 0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(19938, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 0, 0, 80, 1993800, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Commander Sarannis - On Just Summoned - Run Script');

DELETE FROM `smart_scripts` WHERE (`source_type` = 9 AND `entryorguid` = 1993800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1993800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Commander Sarannis - Actionlist - Say Line 0'),
(1993800, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Commander Sarannis - Actionlist - Say Line 1'),
(1993800, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 33, 19938, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Commander Sarannis - Actionlist - Quest Credit \'Finding the Keymaster\'');
