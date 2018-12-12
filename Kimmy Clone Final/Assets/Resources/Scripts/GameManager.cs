using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{ 
	
	void Update () {
		restart();
		quit();
	}

	void restart()
	{
		if (Input.GetKey(KeyCode.R))
		{
			SceneManager.LoadScene("Game");
			Time.timeScale = 1;

		}
		
	}

	void quit()
	{
		if (Input.GetKeyDown(KeyCode.Escape))
		{
			SceneManager.LoadScene("Menu");
		}
	}
}
