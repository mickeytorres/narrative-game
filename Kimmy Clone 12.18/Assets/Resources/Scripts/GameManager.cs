using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{ 
	
	void Update () {
		restart();
	}

	void restart()
	{
		if (Input.GetKey(KeyCode.R))
		{
			SceneManager.LoadScene("SampleScene");
			Time.timeScale = 1;

		}
	}
}
