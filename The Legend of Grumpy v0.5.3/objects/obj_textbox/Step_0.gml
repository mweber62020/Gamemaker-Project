/// @description Handle choice cursor input
if (isChoice)
{
	if (keyboard_check_pressed(vk_up))
		choiceIndex = max(0, choiceIndex - 1);
	if (keyboard_check_pressed(vk_down))
		choiceIndex = min(array_length(choiceOptions) - 1, choiceIndex + 1);
}
