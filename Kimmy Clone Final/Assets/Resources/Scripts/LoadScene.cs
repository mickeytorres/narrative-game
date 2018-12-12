using UnityEngine;
using System.Collections;
using UnityEngine.Experimental.UIElements;
using UnityEngine.SceneManagement;

public class LoadScene : MonoBehaviour
{
	
	public void LoadGameScene()
	{
		SceneManager.LoadScene ("Game");
	}
}

