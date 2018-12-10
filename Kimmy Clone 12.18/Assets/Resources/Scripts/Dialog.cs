using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using UnityEngine;

public class Dialog : MonoBehaviour
{
	[SerializeField] private TextAsset inkJSONAsset;
	[SerializeField] private Story story;

	private void Start()
	{
		story = new Story(inkJSONAsset.text);
	}

	private void Update()
	{
		if (!Input.anyKeyDown) return;

		if (story.currentChoices.Count > 0)
		{
			for (var i = 0; i < story.currentChoices.Count; i++)
			{
				if (Input.GetKeyDown(KeyCode.Space))
				{
					story.ChooseChoiceIndex(i);
				}
			}
		}

		if (!story.canContinue) return;

		var text = story.Continue();
		var choiceText = "";

		if (story.currentChoices.Count > 0)
			foreach (var t in story.currentChoices)
			{
				choiceText += t.text + "\n";
			}
	}
}