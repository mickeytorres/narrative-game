using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.Experimental.UIElements;
using UnityEngine.Internal.Experimental.UIElements;
using Button = UnityEngine.UI.Button;
using Image = UnityEngine.UI.Image;

public class InkManager : MonoBehaviour {

	public AudioSource click;
	public Sprite dana;
	public Sprite kimmy;
	public Sprite danaMom;
	public Sprite kimmyMom;
	public Sprite dean;
	public Sprite donna;
	public Sprite anthony;
	public Sprite amber;
	
	[SerializeField]
	private TextAsset inkJSONAsset;
	private Story story;

	[SerializeField] private Canvas canvas;
//	[SerializeField] private Canvas canvas2;
//	[SerializeField] private Transform panel;

	// UI Prefabs
	[SerializeField] private Text dialoguePrefab;
	
	[SerializeField] private Button buttonPrefab;

//	[SerializeField] private RectTransform _Panel;

	[SerializeField] private Image imagePrefab; 
	
	void Start ()
	{
		story = new Story(inkJSONAsset.text);
		RemoveChildren();
//		panel = Instantiate(panel, canvas) as RectTransform;
		if (!story.canContinue) return;
		var text = story.Continue();
		if (story.currentChoices.Count > 0)
		{
			for (var i = 0; i < story.currentChoices.Count; i++) {
				Choice choice = story.currentChoices [i];
				Button button = CreateChoiceView (choice.text.Trim ());
				
				// Tell the button what to do when we press it
				button.onClick.AddListener (delegate {
					OnClickChoiceButton (choice);
				});
			}
		}
		CreateContentView(text);
	}

	void Update()
	{
		RefreshView();
	}
	
	void RefreshView () {
		if (!Input.anyKeyDown) return;
		
		
		
		if (story.currentChoices.Count > 0)
		{
			for (var i = 0; i < story.currentChoices.Count; i++)
			{
				//KeyCode.Alpha1 = 49
				// "(KeyCode)49" casts 49 to the KeyCode enum
				if (Input.GetKeyDown((KeyCode) 49 + i))
				{
					story.ChooseChoiceIndex(i);
				}
			}
		}

		if (!story.canContinue) return;

		var text = story.Continue();

		RemoveChildren();

		if (story.currentChoices.Count > 0)
		{
			for (var i = 0; i < story.currentChoices.Count; i++) {
				Choice choice = story.currentChoices [i];
				Button button = CreateChoiceView (choice.text.Trim ());
				// Tell the button what to do when we press it
				button.onClick.AddListener (delegate
				{
					click.Play(); //plays click on button press
					OnClickChoiceButton (choice);
				});
			}
		}

		CreateContentView(text);
	}

	// When we click the choice button, tell the story to choose that choice!
	void OnClickChoiceButton (Choice choice) {
		story.ChooseChoiceIndex(choice.index);
		RemoveChildren();
		var text = story.Continue();
		var choiceText = "";
		if (story.currentChoices.Count > 0)
		{
			for (var i = 0; i < story.currentChoices.Count; i++) {
				Choice choices = story.currentChoices [i];
				Button button = CreateChoiceView (choices.text.Trim ());
				// Tell the button what to do when we press it
				button.onClick.AddListener (delegate {
					click.Play();
					OnClickChoiceButton (choices);
				});
			}
		}
		CreateContentView(text);
	}

	// Shows the sprites & story text
	void CreateContentView (string text) {
		var storyText = Instantiate (dialoguePrefab);
		var storyImage = Instantiate(imagePrefab);
		storyText.text = text;
		storyText.transform.SetParent(canvas.transform, false);
		storyImage.transform.SetParent(canvas.transform, false);
		
		storyText.text = text;
		{
			//if have time use this for name display too!
			if (text.Contains("Dana:"))
			{
				Debug.Log("dana");
				storyImage.sprite = dana;
			}
			if (text.Contains("Kimmy:"))
			{
				Debug.Log("kimmy");
				storyImage.sprite = kimmy;
			}
			if (text.Contains("Mom:"))
			{
				Debug.Log("danaMom");
				storyImage.sprite = danaMom;
			}
			if (text.Contains("Kimmy's Mom:"))
			{
				Debug.Log("kimmyMom");
				storyImage.sprite = kimmyMom;
			}
			if (text.Contains("Dean:"))
			{
				Debug.Log("dean");
				storyImage.sprite = dean;
			}
			if (text.Contains("Donna:"))
			{
				Debug.Log("donna");
				storyImage.sprite = donna;
			}
			if (text.Contains("Anthony:"))
			{
				Debug.Log("anthony");
				storyImage.sprite = anthony;
			}
			if (text.Contains("Amber:"))
			{
				Debug.Log("amber");
				storyImage.sprite = amber;
			}
		}
	}

	// Creates a button showing the choice text
	Button CreateChoiceView (string text) {
		// Creates the button from a prefab
		Button choice = Instantiate (buttonPrefab) as Button;
		choice.transform.SetParent (canvas.transform, false);
		
		// Gets the text from the button prefab
		Text choiceText = choice.GetComponentInChildren<Text> ();
		choiceText.text = text;

		// Make the button expand to fit the text
		HorizontalLayoutGroup layoutGroup = choice.GetComponent <HorizontalLayoutGroup> ();
		layoutGroup.childForceExpandHeight = false;

		return choice;
	}

	// Destroys all the children of this gameobject (all the UI)
	void RemoveChildren () {
		int childCount = canvas.transform.childCount;
		for (int i = childCount - 1; i >= 0; --i) {
			Destroy (canvas.transform.GetChild (i).gameObject);
		}
	}
}
