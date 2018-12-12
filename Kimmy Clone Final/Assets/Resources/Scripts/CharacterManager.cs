using System.Collections;
using System.Collections.Generic;
using Resources.Scripts;
using UnityEngine;

public class CharacterManager : MonoBehaviour
{
	//list will hold the character sprites to display them as they talk
	public GameObject[] characters;
	public List<GameObject> actorsList = new List<GameObject>();
	private List<ActorManager> activeActors = new List<ActorManager>();

	[SerializeField]
	private Vector3 leftActorPos, _rightActorPos;

	
	
	void Start ()
	{

		leftActorPos = new Vector3(0.0f, 0.0f, 0.0f);
		_rightActorPos = new Vector3(0.0f, 0.0f, 0.0f);
		
		for (int i = 0; i < characters.Length; i++)
		{
			GameObject newActor = Instantiate(characters[i]);
			newActor.SetActive(false);
			newActor.name = characters[i].name;
			actorsList.Add(newActor);
		}
	}

	public void PlaceActors(string leftActor, string rightActor)
	{
		
		foreach(GameObject gO in actorsList)
		{
			if (gO.name == leftActor)
			{
				gO.SetActive(true);
				activeActors.Add(gO.GetComponent<ActorManager>());
				gO.GetComponent<ActorManager>().ID = 0;
				gO.transform.position = leftActorPos;
			}else if (gO.name == rightActor)
			{
				gO.SetActive(true);
				activeActors.Add(gO.GetComponent<ActorManager>());
				gO.GetComponent<ActorManager>().ID = 1;
				gO.transform.position = _rightActorPos;
			}
		}
		
	}

	// Left = 0, Right = 1
	public void ChangeSprites(string sprite, int ID)
	{
		foreach (ActorManager actor in activeActors)
		{
			if (actor.gameObject.activeInHierarchy)
			{
				if (actor.ID == ID)
				{
					actor.ChangeChar(sprite);
				}
			}
		}
	}
}
