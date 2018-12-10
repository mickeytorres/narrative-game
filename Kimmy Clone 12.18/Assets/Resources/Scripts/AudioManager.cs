using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
	//holds choice click sound
	//holds background music

	public AudioSource Click;

	public void PlayClick()
	{
		Click.Play();
	}
}
